module PropertyTestMacros

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
    attr_reader :instance, :value, :attribute
    base.extend ClassMethods
  end

  module ClassMethods

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

    def it_should_output(expected_xml, assign: true)
      it "should output the correct XML" do
        if assign
          @instance = described_class.new
          instance.send "#{attribute}=", value
        end

        expect(xml(instance)).to eq(expected_xml)
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

    def with_no_attributes_set(&block)
      attribute_context = context "with no attributes set" do
        before(:each) do
          @instance = described_class.new
        end
      end

      attribute_context.class_eval &block
    end

    def with_these_attributes_set(attributes, &block)
      attribute_context = context "with valid attributes set" do
        before(:each) do
          @instance = described_class.new
          attributes.each do |attr, val|
            instance.send "#{attr}=", val
          end
        end
      end

      attribute_context.class_eval &block
    end

  end
end
