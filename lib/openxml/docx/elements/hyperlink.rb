class OpenXml::Docx::Elements::Hyperlink < OpenXml::Docx::Element
  include OpenXml::HasChildren

  tag :hyperlink

  with_namespace :r do
    attribute :id
  end
end
