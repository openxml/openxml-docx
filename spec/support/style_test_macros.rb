module StyleTestMacros

  def xml(part)
    File.read(File.join(File.dirname(__FILE__), "data", "styles", "#{part}_styles.xml")).strip
  end

  def self.included(base)
    attr_reader :style
    base.extend ClassMethods
  end

  module ClassMethods

    def it_should_output_correct_xml(style_xml: nil)
      it "should be able to output the correct XML" do
        if style_xml.nil?
          style_xml = described_class.to_s.split(/::/).last
          style_xml = style_xml.gsub(/(.)([A-Z])/, '\1_\2').downcase
        end

        generated_xml = OpenXml::Builder.new do |xml|
          xml.styleFoo("xmlns:w" => "http://wnamespace.com") {
            style.build_xml(xml)
          }
        end.to_xml

        expect(generated_xml).to eq(xml(style_xml) + "\n")
      end
    end

  end

end
