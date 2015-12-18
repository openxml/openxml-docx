module OpenXml
  module Docx
    module Elements
      class FontSig < Element
        namespace :w
        tag :sig

        with_namespace :w do
          attribute :csb0, expects: :long_hex_number
          attribute :csb1, expects: :long_hex_number
          attribute :usb0, expects: :long_hex_number
          attribute :usb1, expects: :long_hex_number
          attribute :usb2, expects: :long_hex_number
          attribute :usb3, expects: :long_hex_number
        end

      end
    end
  end
end
