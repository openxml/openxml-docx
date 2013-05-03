require 'libxml'
require 'dimensions'
require 'rocx/elements/element'
require 'rocx/core_ext/fixnum'

module Rocx
  module XmlElements
    class Image < XmlElement
      include LibXML
      
      attr_reader :namespace
      attr_accessor :width, :height, :source, :relationships, :filename
      
      def initialize(source, relationships, options={})
        @source = source
        @filename = File.basename(source)
        @relationships = relationships 
        @relationships << ['http://schemas.openxmlformats.org/officeDocument/2006/relationships/image', "word/media/#{@filename}"]
        @width = options[:width]
        @height = options[:height]
        @pic_description = options[:description]
        super()
      end
      
      def create_blipfill(pic_relationship_id)
        blipfill = with_namespace(@pic_namespace) { make_element 'blipFill' }
        blip = with_namespace(@a_namespace) { make_element 'blip', attributes: { 'r:embed' => pic_relationship_id }, attribute_namespace: :none }
        blipfill << blip
        blipfill = with_namespace(@a_namespace) do
          stretch = make_element 'stretch'
          stretch << make_element('fillRect')
          blipfill << stretch
        end
        blipfill
      end
      
      def create_non_visual_properties
        nv_pic_props = with_namespace(@pic_namespace) do
          nvpicpr = make_element 'nvPicPr'
          cnvpr = make_element 'cNvPr', attributes: {'id' => '0', 'name' => "Picture 1", "descr" => filename}, attribute_namespace: :none
          nvpicpr << cnvpr
          
          cnvpicpr = make_element 'cNvPicPr'
          pic_locks = with_namespace(@a_namespace) do
            make_element 'picLocks'
          end
          cnvpicpr << pic_locks
          nvpicpr << cnvpicpr
        end
      end
      
      def create_shape_properties(width, height)
        sppr = with_namespace(@pic_namespace) do
          sppr = make_element 'spPr'
          xfrm = with_namespace(@a_namespace) do
            xfrm = make_element 'xfrm'
            xfrm << make_element('off', attributes: {'x' => '0', 'y' => '0'}, attribute_namespace: :none)
            xfrm << make_element('ext', attributes: {'cx' => width.to_s, 'cy' => height.to_s}, attribute_namespace: :none)
          end
          prstgeom = with_namespace(@a_namespace) do
            prstgeom = make_element 'prstGeom', attributes: {'prst' => 'rect'}, attribute_namespace: :none # pristine geometry
            prstgeom << make_element('avLst')
          end
          sppr << xfrm
          sppr << prstgeom
        end
        sppr
      end
      
      def to_xml(namespace)
        if width.nil? or height.nil?
          width, height = Dimensions.dimensions(source)
        end
        
        width = width.to_emus
        height = height.to_emus
        
        pic_id = "2"
        pic_relationship_id = "rId#{@relationships.length + 1}"
        frame_locks = make_element 'graphicFrameLocks', attributes: {'noChangeAspect' => '1'}
        @a_namespace = XML::Namespace.new(frame_locks, 'a', 'http://schemas.openxmlformats.org/drawingml/2006/main')
        frame_locks.namespaces.namespace = @a_namespace
        
        pic = make_element 'pic'
        @pic_namespace = XML::Namespace.new(pic, 'pic', "http://schemas.openxmlformats.org/drawingml/2006/picture")
        pic.namespaces.namespace = @pic_namespace
        blipfill = create_blipfill(pic_relationship_id)
        nvpicpr = create_non_visual_properties
        sppr = create_shape_properties(width, height)        
        pic << nvpicpr
        pic << blipfill
        pic << sppr
        
        
        
        frame_pr = with_namespace(@wp_namespace) { make_element 'wp:cNvGraphicFramePr' }
        frame_pr << frame_locks
        
        graphic = with_namespace(@a_namespace) do
          graphic_data = make_element 'graphicData', attributes: {'uri' => "http://schemas.openxmlformats.org/drawingml/2006/picture"}, attribute_namespace: :none
          graphic_data << pic
          
          # @a_namespace has already been defined in this document (at graphicFrameLocks),
          # so defining it again here via `XML::Namespace.new(graphic...)` would throw an error
          graphic = make_element 'graphic', attributes: {'xmlns:a' => 'http://schemas.openxmlformats.org/drawingml/2006/main'}, attribute_namespace: :none
          graphic << graphic_data
        end
        
        inline = with_namespace(@wp_namespace) do
          doc_pr = make_element 'wp:docPr', attributes: {'id' => pic_id, 'name' => 'Picture 1', 'descr' => @pic_description || "image"}
          effect_extent = make_element 'wp:effectExtent', attributes: {'l' => '25400', 't' => '0', 'r' => '0', 'b' => '0'}
          extent = make_element 'wp:extent', attributes: {'cx' => width.to_s, 'cy' => height.to_s}
          inline = make_element 'wp:inline', attributes: {'distT' => "0", 'distB' => "0", 'distL' => "0", 'distR' => "0"}
          inline << extent
          inline << effect_extent
          inline << doc_pr
          inline << frame_pr
          inline << graphic
        end
        
        paragraph = with_namespace(namespace) do
          drawing = make_element 'drawing'
          drawing << inline
        
          run = make_element 'r'
          run << drawing
          paragraph = make_element 'p'
          paragraph << run
        end
      end
      
    end
  end
end
