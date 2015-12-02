module ElementTestMacros

  def element_xml(part)
    File.read(File.join(File.dirname(__FILE__), "data", "elements", "#{part}_element.xml")).strip
  end

  def xml(obj)
    doc = Nokogiri::XML::Builder.new do |xml|
      xml.root(root_namespaces) {
        obj.to_xml(xml)
      }
    end.to_xml
    doc_pattern =~ doc ? $1 : ""
  end

  def doc_pattern
    /<\?xml\sversion="1.0"\?>\n<root (?:xmlns:\w+=".+?".?)+>\n\s+([^\s].+)\n<\/root>/m
  end

  def self.included(base)
    attr_reader :instance, :attribute, :value, :args
    base.extend ClassMethods
  end

  def root_namespaces
    { "xmlns:wpc" => 'http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas',
      "xmlns:mo" => 'http://schemas.microsoft.com/office/mac/office/2008/main',
      "xmlns:mv" => 'urn:schemas-microsoft-com:mac:vml',
      "xmlns:o" => 'urn:schemas-microsoft-com:office:office',
      "xmlns:r" => 'http://schemas.openxmlformats.org/officeDocument/2006/relationships',
      "xmlns:m" => 'http://schemas.openxmlformats.org/officeDocument/2006/math',
      "xmlns:v" => 'urn:schemas-microsoft-com:vml',
      "xmlns:wp14" => 'http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing',
      "xmlns:wp" => 'http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing',
      "xmlns:w10" => 'urn:schemas-microsoft-com:office:word',
      "xmlns:w14" => 'http://schemas.microsoft.com/office/word/2010/wordml',
      "xmlns:wpg" => 'http://schemas.microsoft.com/office/word/2010/wordprocessingGroup',
      "xmlns:wpi" => 'http://schemas.microsoft.com/office/word/2010/wordprocessingInk',
      "xmlns:wne" => 'http://schemas.microsoft.com/office/word/2006/wordml',
      "xmlns:wps" => 'http://schemas.microsoft.com/office/word/2010/wordprocessingShape',
      "xmlns:w" => "http://schemas.openxmlformats.org/wordprocessingml/2006/main",
      "xmlns:mc" => "http://schemas.openxmlformats.org/markup-compatibility/2006",
      "xmlns:a" => "http://schemas.openxmlformats.org/drawingml/2006/main",
      "xmlns:a14" => "http://schemas.microsoft.com/office/drawing/2010/main",
      "mc:Ignorable" => "w14 wp14 a14" }
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

    def it_should_assign_successfully(*args)
      it "should assign successfully" do
        expect do
          obj = described_class.new *args
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

    def it_should_output(expected_xml, *args, assign: true)
      it "should output the correct XML" do
        if assign
          @instance = described_class.new *args
          instance.send "#{attribute}=", value
        end

        expect(xml(instance)).to eq(expected_xml)
      end
    end

    def with_no_attributes_set(args: nil, &block)
      attribute_context = context "with no attributes set, it" do
        before(:each) do
          @instance = described_class.new *Array(args)
        end
      end

      attribute_context.class_eval &block
    end

    def with_these_attributes_set(attributes, &block)
      args = attributes.delete(:args)
      attribute_context = context "with valid attributes set" do
        before(:each) do
          @instance = described_class.new *Array(args)
          attributes.each do |attr, val|
            instance.send "#{attr}=", val
          end
        end
      end

      attribute_context.class_eval &block
    end

    def it_should_have_property(property, as_instance_of: nil)
      as_instance_of ||= property

      context "this class" do
        before(:each) do
          @instance = described_class.new
        end

        it "should have the #{property} method defined" do
          expect(instance.respond_to?(property)).to be(true)
        end

        it "should have #{property} return an instance of #{as_instance_of}" do
          class_name = as_instance_of.to_s.split("_").map(&:capitalize).join
          prop_class = OpenXml::Docx::Properties.const_get class_name
          expect(instance.public_send(property)).to be_instance_of(prop_class)
        end
      end
    end

    def it_should_have_value_property(property, as_instance_of: nil, with_value: nil)
      as_instance_of ||= property

      context "this class" do
        before(:each) do
          @instance = described_class.new *Array(args)
        end

        it "should have the #{property} method defined" do
          expect(instance.respond_to?("#{property}")).to be(true)
        end

        it "should have the #{property}= method defined" do
          expect(instance.respond_to?("#{property}=")).to be(true)
        end

        it "should have #{property} return an instance of #{as_instance_of}" do
          instance.public_send "#{property}=", with_value
          class_name = as_instance_of.to_s.split("_").map(&:capitalize).join
          prop_class = OpenXml::Docx::Properties.const_get class_name
          expect(instance.public_send(property)).to be_instance_of(prop_class)
        end
      end
    end

    def with_arguments(*args, &block)
      arg_context = context "" do
        before(:each) do
          @args = args
        end
      end

      arg_context.class_eval &block
    end
  end

end
