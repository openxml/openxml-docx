require "spec_helper"

describe OpenXml::Docx::Properties::Columns do
  include PropertyTestMacros

  it_should_use tag: :cols, name: "columns"

  context "when trying to add columns, it" do
    before(:each) do
      @instance = described_class.new
    end

    it "should raise an exception if the column to be added isn't a column at all" do
      expect { instance << [] }.to raise_error(ArgumentError)
    end
  end

  context "when there are no columns" do
    before(:each) do
      @instance = described_class.new
    end

    it "should not output any XML" do
      expect(xml(instance)).to eq("")
    end
  end

  context "when there are columns" do
    before(:each) do
      @instance = described_class.new
      instance << OpenXml::Docx::Properties::Column.new(1234, 5678)
      instance << OpenXml::Docx::Properties::Column.new(8765, 4321)
    end

    it "should output the correct XML" do
      expect(xml(instance)).to eq("<w:cols>\n    <w:col w:space=\"1234\" w:w=\"5678\"/>\n    <w:col w:space=\"8765\" w:w=\"4321\"/>\n  </w:cols>")
    end
  end

  for_attribute(:equal_width) do
    before(:each) do
      @instance = described_class.new
      @instance << OpenXml::Docx::Properties::Column.new(1, 1)
    end

    context "when the value is true" do
      before(:each) do
        @value = true
      end

      it "should accept the value" do
        expect { instance.send("#{attribute}=", value) }.to_not raise_error
      end

      it "should output the correct value" do
        instance.send("#{attribute}=", value)
        expect(xml(instance)).to eq("<w:cols w:equalWidth=\"true\">\n    <w:col w:space=\"1\" w:w=\"1\"/>\n  </w:cols>")
      end
    end

    for_attribute(:number) do
      before(:each) do
        @instance = described_class.new
        @instance << OpenXml::Docx::Properties::Column.new(1, 1)
      end

      context "when the value is 1" do
        before(:each) do
          @value = 1
        end

        it "should accept the value" do
          expect { instance.send("#{attribute}=", value) }.to_not raise_error
        end

        it "should output the correct value" do
          instance.send("#{attribute}=", value)
          expect(xml(instance)).to eq("<w:cols w:num=\"1\">\n    <w:col w:space=\"1\" w:w=\"1\"/>\n  </w:cols>")
        end
      end

      context "when the value is -1" do
        before(:each) do
          @value = -1
        end

        it "should accept the value" do
          expect { instance.send("#{attribute}=", value) }.to_not raise_error
        end

        it "should output the correct value" do
          instance.send("#{attribute}=", value)
          expect(xml(instance)).to eq("<w:cols w:num=\"-1\">\n    <w:col w:space=\"1\" w:w=\"1\"/>\n  </w:cols>")
        end
      end

      it_should_not_allow_floats
      it_should_not_allow_invalid_value
    end

    for_attribute(:separator) do
      before(:each) do
        @instance = described_class.new
        @instance << OpenXml::Docx::Properties::Column.new(1, 1)
      end

      context "when the value is true" do
        before(:each) do
          @value = true
        end

        it "should accept the value" do
          expect { instance.send("#{attribute}=", value) }.to_not raise_error
        end

        it "should output the correct value" do
          instance.send("#{attribute}=", value)
          expect(xml(instance)).to eq("<w:cols w:sep=\"true\">\n    <w:col w:space=\"1\" w:w=\"1\"/>\n  </w:cols>")
        end
      end
    end

    for_attribute(:space) do
      before(:each) do
        @instance = described_class.new
        @instance << OpenXml::Docx::Properties::Column.new(1, 1)
      end

      context "when the value is 1" do
        before(:each) do
          @value = 1
        end

        it "should accept the value" do
          expect { instance.send("#{attribute}=", value) }.to_not raise_error
        end

        it "should output the correct value" do
          instance.send("#{attribute}=", value)
          expect(xml(instance)).to eq("<w:cols w:space=\"1\">\n    <w:col w:space=\"1\" w:w=\"1\"/>\n  </w:cols>")
        end
      end

      context "when the value is -1" do
        before(:each) do
          @value = -1
        end

        it "should accept the value" do
          expect { instance.send("#{attribute}=", value) }.to_not raise_error
        end

        it "should output the correct value" do
          instance.send("#{attribute}=", value)
          expect(xml(instance)).to eq("<w:cols w:space=\"-1\">\n    <w:col w:space=\"1\" w:w=\"1\"/>\n  </w:cols>")
        end
      end

      it_should_not_allow_floats
      it_should_not_allow_invalid_value
    end

  end
end
