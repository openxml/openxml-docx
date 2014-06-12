module Rocx
  module Elements
    class Element
      include AttributeBuilder

      class << self
        attr_reader :property_name

        def tag(*args)
          @tag = args.first if args.any?
          @tag
        end

        def name(*args)
          @property_name = args.first if args.any?
          @name
        end
      end

      def tag
        self.class.tag || default_tag
      end

      def name
        self.class.property_name || default_name
      end

    private

      def default_tag
        (class_name[0, 1].downcase + class_name[1..-1]).to_sym
      end

      def default_name
        class_name.gsub(/(.)([A-Z])/, '\1_\2').downcase
      end

      def class_name
        self.class.to_s.split(/::/).last
      end

    end
  end
end
