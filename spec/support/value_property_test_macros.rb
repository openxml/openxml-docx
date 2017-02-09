module ValuePropertyTestMacros

  def xml(obj)
    doc = OpenXml::Builder.new do |xml|
      xml.root("xmlns:w" => "http://wnamespace.org") {
        obj.to_xml(xml)
      }
    end.to_xml
    doc_pattern =~ doc ? $1 : ""
  end

  def doc_pattern
    /<\?xml\sversion="1.0"\sencoding=\"utf-8\"\?>\n<root xmlns:w="http:\/\/wnamespace.org">\n\s+([^\s].+)\n<\/root>/m
  end

  def self.included(base)
    attr_reader :instance, :value
    base.extend ClassMethods
  end

  module ClassMethods

    def it_should_use(tag: nil, name: nil, value: nil)
      context "always" do
        before(:each) do
          @instance = described_class.new(value)
        end

        it "should use the correct tag" do
          expect(instance.tag).to eq(tag)
        end

        it "should use the correct name" do
          expect(instance.name).to eq(name)
        end
      end
    end

    def it_should_output(expected_xml)
      it "should output the correct XML" do
        @instance = described_class.new(value)
        expect(xml(instance)).to eq(expected_xml)
      end
    end

    def with_value(value, &block)
      value_context = context "when the value is #{value.inspect}" do
        before(:each) do
          @value = value
        end
      end

      value_context.class_eval &block
    end

    def it_should_work
      it "should not raise an exception" do
        expect { described_class.new(value) }.to_not raise_error
      end
    end

    def it_should_not_work
      it "should raise an exception" do
        expect { described_class.new(value) }.to raise_error(ArgumentError)
      end
    end

  end
end
