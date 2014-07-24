module Rocx
  class Style
    include AttributeBuilder
    include PropertyBuilder

    attr_reader :paragraph, :character, :type

    attribute :custom, expects: :true_or_false, displays_as: :customStyle
    attribute :default, expects: :true_or_false
    attribute :id, expects: :string, displays_as: :styleId
    attribute :type, expects: :valid_style_type

    value_property :hidden_style
    value_property :linked_style
    value_property :locked, as: :style_lock
    value_property :personal
    value_property :personal_compose
    value_property :personal_reply
    value_property :primary_style
    value_property :semi_hidden
    value_property :style_name
    value_property :ui_priority
    value_property :unhide_when_used

    def initialize(type)
      self.type = type
    end

    def type=(value)
      @type = value
      send "install_#{value}_properties"
    end

    def tag
      :style
    end

    def name
      "style"
    end

    def to_xml(xml)
      xml["w"].public_send(tag, xml_attributes) {
        property_xml(xml)
      }
    end

    def paragraph_style?
      type == :paragraph
    end

    VALID_STYLE_TYPES = %i(character paragraph)

  private

    def install_paragraph_properties
      @character = nil
      @paragraph = Rocx::Elements::Paragraph.new
    end

    def install_character_properties
      @paragraph = nil
      @character = Rocx::Elements::Run.new
    end

    def property_xml(xml)
      if paragraph_style?
        paragraph.property_xml(xml)
      else
        character.property_xml(xml)
      end
    end

    def valid_style_type(value)
      valid_in? value, VALID_STYLE_TYPES
    end

  end
end
