module OpenXml
  module Docx
    module Elements
      class Control < OpenXml::Docx::Element
        attribute :id, expects: :string, namespace: :r

        with_namespace :w do
          attribute :unique_name, expects: :string, displays_as: :name
          attribute :shape_id, expects: :string, displays_as: :shapeid
        end

      end
    end
  end
end
