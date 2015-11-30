module OpenXml
  module Docx
    module Properties
      class Tab < BaseProperty
        attr_reader :position, :type, :leader

        VALID_TYPES = %i(bar center clear decimal end num start)
        VALID_LEADERS = [nil, :dot, :heavy, :hyphen, :middleDot, :none, :underscore]

        def initialize(position, type, leader=nil)
          self.position = position
          self.type = type
          self.leader = leader
        end

        def position=(value)
          raise ArgumentError, invalid_position_message unless valid_position?(value)
          @position = value
        end

        def type=(value)
          raise ArgumentError, invalid_type_message unless valid_type?(value)
          @type = value
        end

        def leader=(value)
          raise ArgumentError, invalid_leader_message unless valid_leader?(value)
          @leader = value
        end

        def to_xml(xml)
          xml["w"].public_send(tag, xml_attributes)
        end

      private

        def xml_attributes
          attrs = { "w:pos" => position,
                    "w:val" => type}
          attrs["w:leader"] = leader if leader
          attrs
        end

        def invalid_position_message
          "Invalid position: must be an integer"
        end

        def valid_position?(value)
          value.is_a?(Integer)
        end

        def invalid_type_message
          "Invalid type: must be one of: #{VALID_TYPES.join(", ")}"
        end

        def valid_type?(value)
          VALID_TYPES.member? value
        end

        def invalid_leader_message
          "Invalid leader: must be one of: #{VALID_LEADERS.join(", ")}"
        end

        def valid_leader?(value)
          VALID_LEADERS.member? value
        end

      end
    end
  end
end
