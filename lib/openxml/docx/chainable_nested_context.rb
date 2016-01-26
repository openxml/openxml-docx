module OpenXml
  module Docx
    module ChainableNestedContext
      def end_chain
        @self_was
      end
    end
  end
end
