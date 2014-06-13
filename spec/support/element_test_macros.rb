module ElementTestMacros

  def element_xml(part)
    File.read(File.join(File.dirname(__FILE__), "data", "elements", "#{part}_element.xml")).strip
  end

  def xml(obj)
    doc = Nokogiri::XML::Builder.new do |xml|
      xml.root("xmlns:w" => "http://wnamespace.org") {
        obj.to_xml(xml)
      }
    end.to_xml
    doc_pattern =~ doc ? $1 : ""
  end

  def doc_pattern
    /<\?xml\sversion="1.0"\?>\n<root xmlns:w="http:\/\/wnamespace.org">\n\s+([^\s].+)\n<\/root>/m
  end

  def self.included(base)
    attr_reader :instance, :attribute, :value
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
            instance.to_xml(xml)
          }
        end.to_xml

        expect(generated_xml).to eq(element_xml(node_xml) + "\n")
      end
    end

    def it_should_use(tag: nil, name: nil, value: nil)
      context "always" do
        before(:each) do
          if value.nil?
            @instance = described_class.new
          else
            @instance = described_class.new(*value)
          end
        end

        it "should use the correct tag" do
          expect(instance.tag).to eq(tag)
        end

        it "should use the correct name" do
          expect(instance.name).to eq(name)
        end
      end
    end

    def for_attribute(attribute, &block)
      attribute_context = context "for the #{attribute} attribute" do
        before(:each) do
          @attribute = attribute
        end
      end

      attribute_context.class_eval &block
    end

    def with_value(value, &block)
      value_context = context "with the value as #{value}" do
        before(:each) do
          @value = value
        end
      end

      value_context.class_eval &block
    end

    def it_should_assign_successfully
      it "should assign successfully" do
        expect do
          obj = described_class.new
          obj.send "#{attribute}=", value
        end.to_not raise_error
      end
    end

    def it_should_raise_an_exception
      it "should raise an exception" do
        expect do
          obj = described_class.new
          obj.send "#{attribute}=", value
        end.to raise_error(ArgumentError)
      end
    end

    def it_should_output(expected_xml, assign: true)
      it "should output the correct XML" do
        if assign
          @instance = described_class.new
          instance.send "#{attribute}=", value
        end

        expect(xml(instance)).to eq(expected_xml)
      end
    end

  end

end
