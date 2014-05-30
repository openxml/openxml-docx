module Rocx
  module Properties
    class Tabs
      include Enumerable

      def initialize
        @tabs = []
      end

      def <<(tab)
        raise ArgumentError, invalid_tab_message unless valid_tab?(tab)
        tabs << tab
      end

      def each(*args, &block)
        tabs.each *args, &block
      end

      def render?
        !tabs.length.zero?
      end

      def to_xml(xml)
        return unless render?

        xml["w"].public_send(tag) {
          each { |tab| tab.to_xml(xml) }
        }
      end

      def name
        "tabs"
      end

      def tag
        :tabs
      end

    protected

      attr_reader :tabs

    private

      def invalid_tab_message
        "Tabs must be instances of Rocx::Properties::Tab"
      end

      def valid_tab?(tab)
        tab.is_a?(Rocx::Properties::Tab)
      end

    end
  end
end
