module OpenXml
  module Docx
    module Elements
      class CompatibilitySetting < Container
        tag :compatSetting

        with_namespace :w do
          attribute :setting_name, expects: :string, displays_as: :name
          attribute :uri, expects: :string
          attribute :value, expects: :string, displays_as: :val
        end
      end
    end
  end
end
