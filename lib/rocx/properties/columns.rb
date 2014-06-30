module Rocx
  module Properties
    class Columns < BaseProperty
      include Enumerable

      tag :cols

      def initialize
        @columns = []
      end

      def <<(column)
        raise ArgumentError, invalid_column_message unless valid_column?(column)
        @columns << column
      end

      def each(*args, &block)
        columns.each *args, &block
      end

      def render?
        !columns.length.zero?
      end

      def to_xml(xml)
        return unless render?

        xml["w"].public_send(tag) {
          each { |column| column.to_xml(xml) }
        }
      end

    protected

      attr_reader :columns

    private

      def invalid_column_message
        "Columns must be instances of Rocx::Properties::Column"
      end

      def valid_column?(column)
        column.is_a?(Rocx::Properties::Column)
      end

    end
  end
end
