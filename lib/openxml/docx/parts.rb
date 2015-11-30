module OpenXml
  module Docx
    module Parts
    end
  end
end

Dir.glob("#{File.join(File.dirname(__FILE__), "parts", "*.rb")}").each do |file|
  require file
end
