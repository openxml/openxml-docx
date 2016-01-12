require "openxml/package"
require "openxml/drawingml"
require "open-uri"

module OpenXml
  module Docx
    class Package < OpenXml::Package
      attr_reader :document,
                  :settings,
                  :headers,
                  :footers,
                  :styles,
                  :fonts,
                  :image_names

      content_types do
        default "xml", TYPE_XML
        default "odttf", TYPE_OBSCURED_FONT
        default "jpeg", TYPE_IMAGE[:jpeg]
        default "png", TYPE_IMAGE[:png]
        default "gif", TYPE_IMAGE[:gif]
        default "bmp", TYPE_IMAGE[:bmp]
        default "tiff", TYPE_IMAGE[:tiff]
        override "/word/styles.xml", TYPE_STYLES
        override "/word/settings.xml", TYPE_SETTINGS
        override "/word/fontTable.xml", TYPE_FONT_TABLE
      end

      def initialize
        super

        rels.add_relationship REL_DOCUMENT, "/word/document.xml"
        @settings = OpenXml::Docx::Parts::Settings.new
        @styles = OpenXml::Docx::Parts::Styles.new
        @fonts = OpenXml::Docx::Parts::Fonts.new
        @document = OpenXml::Docx::Parts::Document.new
        @headers = []
        @footers = []
        @image_names = []

        document.relationships.add_relationship REL_STYLES, "styles.xml"
        document.relationships.add_relationship REL_SETTINGS, "settings.xml"
        document.relationships.add_relationship REL_FONT_TABLE, "fontTable.xml"

        add_part "word/_rels/document.xml.rels", document.relationships
        add_part "word/_rels/fontTable.xml.rels", fonts.relationships
        add_part "word/document.xml", document
        add_part "word/settings.xml", settings
        add_part "word/styles.xml", styles
        add_part "word/fontTable.xml", fonts
      end

      def embed_truetype_font(path: nil, name: nil)
        open(path, "rb") do |source_font|
          obfuscation_data = obfuscate_font source_font
          data = obfuscation_data[:bytes] << source_font.read
          destination_font_name = "font#{fonts.fonts.count + 1}.odttf"
          add_part "word/fonts/#{destination_font_name}", OpenXml::Parts::UnparsedPart.new(data)
          font_relationship = fonts.relationships.add_relationship REL_FONT, "fonts/#{destination_font_name}"

          font_description = OpenXml::Docx::Elements::Font.new
          font_description.font_name = name
          embed_tag = OpenXml::Docx::Elements::EmbedRegular.new
          embed_tag.font_key = "{#{obfuscation_data[:key]}}"
          embed_tag.relationship_id = font_relationship.id
          font_description << embed_tag
          fonts << font_description
        end
      end

      def embed_image(path: nil, content_type: nil, into_part: nil, rid_only: true, options: {})
        return if path.nil?
        into_part = document unless into_part.respond_to?(:relationships)

        extension_match = path.match(/\.(?<extension>[^\.]+?)(?:\?.+)?$/)
        content_type ||= extension_match[:extension] if extension_match
        return if content_type.nil?

        content_type = "jpeg" if content_type == "jpg"
        content_type = content_type.to_sym

        open(path, "rb") do |source_image|
          destination_image_name = "image#{image_names.count + 1}.#{content_type}"
          add_part "word/media/#{destination_image_name}", OpenXml::Parts::UnparsedPart.new(source_image.read)
          image_names << destination_image_name

          image_relationship = into_part.relationships.add_relationship REL_IMAGE, "media/#{destination_image_name}"
          rid_only ? image_relationship.id : image(image_relationship.id, options: options)
        end
      end

      def add_header(header)
        headers << header
        header_name = "header#{headers.count}.xml"
        Package.content_types { override "/word/#{header_name}", TYPE_HEADER }
        add_part "word/#{header_name}", header
        add_part "word/_rels/#{header_name}.rels", header.relationships
        relationship = document.relationships.add_relationship REL_HEADER, header_name
        relationship.id
      end

      def add_footer(footer)
        footers << footer
        footer_name = "footer#{footers.count}.xml"
        Package.content_types { override "/word/#{footer_name}", TYPE_FOOTER }
        add_part "word/#{footer_name}", footer
        add_part "word/_rels/#{footer_name}.rels", footer.relationships
        relationship = document.relationships.add_relationship REL_FOOTER, footer_name
        relationship.id
      end

    private

      def obfuscate_font(font)
        # From the OpenXml spec, section 17.8.1, the algorithm for obfuscating a font:
        # - Generate a GUID, which is used and stored as the obfuscation key
        # - Reverse the order of the bytes in the GUID (i.e. Big Endian ordering)
        # - XOR the value with the first 32 bytes of the binary: once against 0-15, once against 16-31
        # - Store the resulting file in the document, and store the obfuscation key in the fontKey attribute

        key = SecureRandom::uuid.upcase # Spec requires hex characters be uppercase
        raw_key = key.gsub("-", "")
        big_endian_key = [raw_key].pack("H*").bytes.reverse
        obfuscated_bytes = []
        2.times do
          bytes = font.read(16).bytes
          (0...16).each do |index|
            obfuscated_bytes << (bytes[index] ^ big_endian_key[index])
          end
        end

        { key: key, bytes: obfuscated_bytes.pack("C*") }
      end

      def image(image_rid: nil, options: {})
        return if image_rid.nil?

        width = options.fetch(:width, 0)
        height = options.fetch(:height, 0)

        # This is the overall container for the drawing elements
        drawing = OpenXml::Docx::Elements::Drawing.new

        # This is the anchor that provides positioning information in Word
        anchor = options[:anchor] ? OpenXml::Docx::Elements::WordProcessingDrawingAnchor.new : OpenXml::Docx::Elements::WordProcessingDrawingInline.new
        anchor.distance_from_bottom = options.fetch(:db, 0)
        anchor.distance_from_top = options.fetch(:dt, 0)
        anchor.distance_from_left = options.fetch(:dl, 0)
        anchor.distance_from_right = options.fetch(:dr, 0)

        if options[:anchor]
          anchor.allow_overlap = options.fetch(:allow_overlap, true)
          anchor.behind_document = options.fetch(:behind_document, false)
          anchor.layout_in_cell = options.fetch(:layout_in_cell, true)
          anchor.locked = options.fetch(:locked, false)
          anchor.z_index = options.fetch(:z_index, 1000)
          anchor.simple_position = options.fetch(:use_simple_position, false)

          # These elements are required to be children of anchor and supply the actual positioning information
          simple_pos = OpenXml::Docx::Elements::WordProcessingDrawingSimplePosition.new
          position = options.fetch(:position, [0, 0])
          simple_pos.x = position[0]
          simple_pos.y = position[1]
          anchor << simple_pos

          position_h = OpenXml::Docx::Elements::WordProcessingDrawingPositionH.new
          position_h.relative_from = :column
          position_offset = OpenXml::Docx::Elements::WordProcessingDrawingPositionOffset.new
          position_offset.value = position[0].to_s
          position_h << position_offset
          anchor << position_h
          position_v = OpenXml::Docx::Elements::WordProcessingDrawingPositionV.new
          position_v.relative_from = :paragraph
          position_offset = OpenXml::Docx::Elements::WordProcessingDrawingPositionOffset.new
          position_offset.value = position[1].to_s
          position_v << position_offset
          anchor << position_v
        end

        # Extent is the size of the Object
        extent = OpenXml::Docx::Elements::WordProcessingDrawingExtent.new
        extent.extent_length = width
        extent.extent_width = height
        anchor << extent

        if options[:anchor]
          wrap = options.fetch(:wrap, { type: :none })
          wrap_obj = case wrap[:type]
          when :polygon
            return nil unless wrap[:coordinates]
            behavior_container = wrap[:behavior] == :through ? OpenXml::Docx::Elements::WordProcessingDrawingWrapThrough.new : OpenXml::Docx::Elements::WordProcessingDrawingWrapTight.new
            behavior_container.distance_from_left = wrap.fetch(:distL, 0)
            behavior_container.distance_from_right = wrap.fetch(:distR, 0)
            behavior_container.wrap_text = wrap.fetch(:wrap_text, :bothSides)
            polygon = OpenXml::Docx::Elements::WordProcessingDrawingWrapPolygon.new
            wrap[:coordinates].each_with_index do |(x, y), index|
              coordinate_type = index == 0 ? :start : :lineTo
              coordinate = OpenXml::Docx::Elements::WordProcessingDrawingWrapCoordinate.new(coordinate_type)
              coordinate.x = x
              coordinate.y = y
              polygon << coordinate
            end
            behavior_container << polygon
            behavior_container
          when :square
            square = OpenXml::Docx::Elements::WordProcessingDrawingWrapSquare.new
            square.distance_from_bottom = wrap.fetch(:distB, 0)
            square.distance_from_left = wrap.fetch(:distL, 0)
            square.distance_from_right = wrap.fetch(:distR, 0)
            square.distance_from_top = wrap.fetch(:distT, 0)
            square.wrap_text = wrap.fetch(:wrap_text, :bothSides)
            square
          when :top_and_bottom
            top_bottom = OpenXml::Docx::Elements::WordProcessingDrawingWrapTopAndBottom.new
            top_bottom.distance_from_bottom = wrap.fetch(:distB, 0)
            top_bottom.distance_from_top = wrap.fetch(:distT, 0)
            top_bottom
          else
            nil
          end
          anchor << (wrap_obj || OpenXml::Docx::Elements::WordProcessingDrawingWrapNone.new)
        end

        # Object (non-visual) properties are also required
        doc_pr = OpenXml::Docx::Elements::WordProcessingDrawingObjectNvProperties.new
        doc_pr.description = options[:filename] || options[:name] || "Image"
        doc_pr.object_name = options[:name] || "Image"
        doc_pr.id = @image_names.count + 1
        anchor << doc_pr

        # This is the actual graphics object
        graphic = OpenXml::DrawingML::Elements::Graphic.new
        graphic_data = OpenXml::DrawingML::Elements::GraphicData.new
        graphic_data.uri = "http://schemas.openxmlformats.org/drawingml/2006/picture"
        pic_container = OpenXml::DrawingML::Elements::Picture.new

        # Must also define the Picture's non-visual Properties
        pic_nv_properties = OpenXml::DrawingML::Elements::NonVisualPictureProperties.new
        nv_properties = OpenXml::DrawingML::Elements::NonVisualDrawingProperties.new
        nv_properties.id = @image_names.count + 1
        nv_properties.picture_name = options[:filename] || options[:name] || "Image"
        nv_properties.description = options[:name] || "Image"
        pic_nv_properties << nv_properties
        drawing_properties = OpenXml::DrawingML::Elements::NonVisualPictureDrawingProperties.new
        picture_locks = OpenXml::DrawingML::Elements::PictureLocks.new
        picture_locks.disallow_aspect_ratio_changes = true
        picture_locks.disallow_arrowhead_changes = true
        drawing_properties << picture_locks
        pic_nv_properties << drawing_properties
        pic_container << pic_nv_properties

        # Blip Fill defines the picture that will fill the object's shape
        blip_fill = OpenXml::DrawingML::Elements::BlipFill.new
        pic_ref = OpenXml::DrawingML::Elements::Blip.new
        pic_ref.embed = image_rid
        stretch = OpenXml::DrawingML::Elements::Stretch.new
        fill_rect = OpenXml::DrawingML::Elements::FillRectangle.new
        stretch << fill_rect
        blip_fill << pic_ref
        blip_fill << stretch
        blip_fill << OpenXml::DrawingML::Elements::SourceRectangle.new
        pic_container << blip_fill

        # Must also define the picture's shape properties
        shape_properties = OpenXml::DrawingML::Elements::PictureShapeProperties.new
        shape_properties.black_and_white_mode = :auto
        transform = OpenXml::DrawingML::Elements::TransformEffect.new
        offset = OpenXml::DrawingML::Elements::Offset.new
        offset.x = 0
        offset.y = 0
        transform << offset
        extent = OpenXml::DrawingML::Elements::Extents.new
        extent.extent_length = width
        extent.extent_width = height
        transform << extent
        shape_properties << transform

        preset_geometry = OpenXml::DrawingML::Elements::PresetGeometry.new
        preset_geometry.preset = :rect
        adj_values_list = OpenXml::DrawingML::Elements::AdjustValuesList.new
        preset_geometry << adj_values_list
        shape_properties << preset_geometry
        no_fill = OpenXml::DrawingML::Elements::NoFill.new
        shape_properties << no_fill

        outline = OpenXml::DrawingML::Elements::Outline.new
        outline << no_fill

        shape_properties << outline

        pic_container << shape_properties

        graphic_data << pic_container
        graphic << graphic_data

        anchor << graphic
        drawing << anchor

        drawing
      end

    end
  end
end
