module OpenXml
  module Docx
    module Properties
      class BaseProperty
        attr_reader :value

        class << self
          attr_reader :property_name
          attr_reader :allowed_tags

          def tag_is_one_of(tags)
            attr_accessor :tag
            @allowed_tags = tags
          end

          def tag(*args)
            @tag = args.first if args.any?
            @tag
          end

          def name(*args)
            @property_name = args.first if args.any?
            @property_name
          end

          def namespace(*args)
            @namespace = args.first if args.any?
            @namespace
          end
        end

        def initialize(tag=nil, *args)
          return unless self.class.allowed_tags
          unless self.class.allowed_tags.include?(tag)
            raise ArgumentError, "Invalid tag name for #{name}: #{tag.inspect}. It should be one of #{self.class.allowed_tags.join(", ")}."
          end
          @tag = tag

          if block_given?
            if block.arity == 0
              instance_eval(&block)
            else
              yield self
            end
          end
        end

        def render?
          !value.nil?
        end

        def name
          self.class.property_name || default_name
        end

        def default_name
          class_name.gsub(/(.)([A-Z])/, '\1_\2').downcase
        end

        def tag
          self.class.tag || default_tag
        end

        def default_tag
          (class_name[0, 1].downcase + class_name[1..-1]).to_sym
        end

        def namespace
          self.class.namespace || default_namespace
        end

        def default_namespace
          :w
        end

      private

        def class_name
          self.class.to_s.split(/::/).last
        end

      end
    end
  end
end
