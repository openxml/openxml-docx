module OpenXml
  module Vml
    module Elements
      class TextBox < OpenXml::Docx::Elements::Container
        namespace :v
        tag :textbox

        attribute :id, expects: :string
        attribute :inset, expects: :string
        attribute :insetmode, one_of: %i(auto custom)
        attribute :singleclick, expects: :boolean
        attribute :style, expects: :string

      end
    end
  end
end
