module ElementTestMacros

  def xml(part)
    File.read(File.join(File.dirname(__FILE__), "data", "elements", "#{part}_element.xml")).strip
  end

  def self.included(base)
    attr_reader :node
    base.extend ClassMethods
  end

  module ClassMethods

    def it_should_output_correct_xml(node_xml: nil)
      it "should be able to output the correct XML" do
        if node_xml.nil?
          node_xml = described_class.to_s.split(/::/).last
          node_xml = node_xml.gsub(/(.)([A-Z])/, '\1_\2').downcase
        end

        generated_xml = Nokogiri::XML::Builder.new do |xml|
          xml.root("xmlns:w" => "http://wnamespace.org") {
            node.to_xml(xml)
          }
        end.to_xml

        expect(generated_xml).to eq(xml(node_xml) + "\n")
      end
    end

  end

end
