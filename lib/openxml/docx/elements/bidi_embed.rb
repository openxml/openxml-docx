module OpenXml
  module Docx
    module Elements
      class BidiEmbed < Container
        tag :dir
        attribute :direction, one_of: %i(rtl ltr), displays_as: :val, namespace: :w
      end
    end
  end
end
