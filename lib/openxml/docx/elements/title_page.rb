module OpenXml
  module Docx
    module Elements
      class TitlePage < OpenXml::Docx::Element
        tag :titlePg

        attribute :value, expects: :boolean, displays_as: :val, namespace: :w

      end
    end
  end
end
