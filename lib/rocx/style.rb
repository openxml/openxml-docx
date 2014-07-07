module Rocx
  class Style
    include AttributeBuilder
    include PropertyBuilder

    attr_reader :paragraph, :character

    attribute :custom, expects: :true_or_false, displays_as: :customStyle
    attribute :default, expects: :true_or_false
    attribute :id, expects: :string, displays_as: :styleId
    attribute :type, expects: :valid_style_type

    value_property :style_name

    def initialize
      @paragraph = Rocx::Elements::Paragraph.new
      @character = Rocx::Elements::Run.new
    end

    def tag
      :style
    end

    def name
      "style"
    end

    def to_xml(xml)
      xml["w"].public_send(tag, xml_attributes) {
        paragraph.property_xml(xml)
        character.property_xml(xml)
      }
    end

    VALID_STYLE_TYPES = %i(character numbering paragraph table)

  private

    def valid_style_type(value)
      valid_in? value, VALID_STYLE_TYPES
    end

  end
end
