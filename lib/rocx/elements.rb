module Rocx
  module XmlElements
  end
end

Dir.glob("#{File.join(File.dirname(__FILE__), "elements", "*.rb")}").each do |file|
  require file
end
