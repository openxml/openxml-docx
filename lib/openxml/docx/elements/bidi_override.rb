module OpenXml
  module Docx
    module Elements
      class BidiOverride < Container
        tag :bdo
        attribute :direction, one_of: %i(rtl ltr), displays_as: :val, namespace: :w

      end
    end
  end
end
