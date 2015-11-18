require "spec_helper"

describe OpenXml::Docx::Properties::LatentStyles do
  include PropertyTestMacros

  it_should_use tag: :latentStyles, name: "latent_styles"

  context "when trying to add exceptions, it" do
    before(:each) do
      @instance = described_class.new
    end

    it "should raise an exception if the exception to be added isn't an exception at all" do
      expect { instance << [] }.to raise_error(ArgumentError)
    end
  end

  context "when there are no exceptions" do
    before(:each) do
      @instance = described_class.new
    end

    it "should still output its XML" do
      expect(xml(instance)).to eq("<w:latentStyles/>")
    end
  end

  context "when there are exceptions" do
    before(:each) do
      @instance = described_class.new
      instance << OpenXml::Docx::Properties::LatentStylesException.new("StyleName1")
      instance << OpenXml::Docx::Properties::LatentStylesException.new("StyleName2")
    end

    it "should output the correct XML" do
      expect(xml(instance)).to eq("<w:latentStyles>\n    <w:lsdException w:name=\"StyleName1\"/>\n    <w:lsdException w:name=\"StyleName2\"/>\n  </w:latentStyles>")
    end
  end

  for_attribute(:count) do
    before(:each) do
      @instance = described_class.new
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
        expect(xml(instance)).to eq("<w:latentStyles w:count=\"1\"/>")
      end
    end

    it_should_not_allow_negative_numbers
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:default_locked_state) do
    before(:each) do
      @instance = described_class.new
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
        expect(xml(instance)).to eq("<w:latentStyles w:defLockedState=\"true\"/>")
      end
    end
  end

  for_attribute(:default_qformat) do
    before(:each) do
      @instance = described_class.new
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
        expect(xml(instance)).to eq("<w:latentStyles w:defQFormat=\"true\"/>")
      end
    end
  end

  for_attribute(:default_semi_hidden) do
    before(:each) do
      @instance = described_class.new
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
        expect(xml(instance)).to eq("<w:latentStyles w:defSemiHidden=\"true\"/>")
      end
    end
  end

  for_attribute(:default_ui_priority) do
    before(:each) do
      @instance = described_class.new
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
        expect(xml(instance)).to eq("<w:latentStyles w:defUIPriority=\"1\"/>")
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
        expect(xml(instance)).to eq("<w:latentStyles w:defUIPriority=\"-1\"/>")
      end
    end

    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:default_unhide_when_used) do
    before(:each) do
      @instance = described_class.new
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
        expect(xml(instance)).to eq("<w:latentStyles w:defUnhideWhenUsed=\"true\"/>")
      end
    end
  end

  # for_attribute(:equal_width) do
  #   before(:each) do
  #     @instance = described_class.new
  #     @instance << OpenXml::Docx::Properties::Column.new(1, 1)
  #   end
  #
  #   context "when the value is true" do
  #     before(:each) do
  #       @value = true
  #     end
  #
  #     it "should accept the value" do
  #       expect { instance.send("#{attribute}=", value) }.to_not raise_error
  #     end
  #
  #     it "should output the correct value" do
  #       instance.send("#{attribute}=", value)
  #       expect(xml(instance)).to eq("<w:cols w:equalWidth=\"true\">\n    <w:col w:space=\"1\" w:w=\"1\"/>\n  </w:cols>")
  #     end
  #   end
  #
  #   for_attribute(:number) do
  #     before(:each) do
  #       @instance = described_class.new
  #       @instance << OpenXml::Docx::Properties::Column.new(1, 1)
  #     end
  #
  #     context "when the value is 1" do
  #       before(:each) do
  #         @value = 1
  #       end
  #
  #       it "should accept the value" do
  #         expect { instance.send("#{attribute}=", value) }.to_not raise_error
  #       end
  #
  #       it "should output the correct value" do
  #         instance.send("#{attribute}=", value)
  #         expect(xml(instance)).to eq("<w:cols w:num=\"1\">\n    <w:col w:space=\"1\" w:w=\"1\"/>\n  </w:cols>")
  #       end
  #     end
  #
  #     context "when the value is -1" do
  #       before(:each) do
  #         @value = -1
  #       end
  #
  #       it "should accept the value" do
  #         expect { instance.send("#{attribute}=", value) }.to_not raise_error
  #       end
  #
  #       it "should output the correct value" do
  #         instance.send("#{attribute}=", value)
  #         expect(xml(instance)).to eq("<w:cols w:num=\"-1\">\n    <w:col w:space=\"1\" w:w=\"1\"/>\n  </w:cols>")
  #       end
  #     end
  #
  #     with_value(1.3) do
  #       it_should_raise_an_exception
  #     end
  #
  #     with_value(:a_lot) do
  #       it_should_raise_an_exception
  #     end
  #   end
  #
  #   for_attribute(:separator) do
  #     before(:each) do
  #       @instance = described_class.new
  #       @instance << OpenXml::Docx::Properties::Column.new(1, 1)
  #     end
  #
  #     context "when the value is true" do
  #       before(:each) do
  #         @value = true
  #       end
  #
  #       it "should accept the value" do
  #         expect { instance.send("#{attribute}=", value) }.to_not raise_error
  #       end
  #
  #       it "should output the correct value" do
  #         instance.send("#{attribute}=", value)
  #         expect(xml(instance)).to eq("<w:cols w:sep=\"true\">\n    <w:col w:space=\"1\" w:w=\"1\"/>\n  </w:cols>")
  #       end
  #     end
  #   end
  #
  #   for_attribute(:space) do
  #     before(:each) do
  #       @instance = described_class.new
  #       @instance << OpenXml::Docx::Properties::Column.new(1, 1)
  #     end
  #
  #     context "when the value is 1" do
  #       before(:each) do
  #         @value = 1
  #       end
  #
  #       it "should accept the value" do
  #         expect { instance.send("#{attribute}=", value) }.to_not raise_error
  #       end
  #
  #       it "should output the correct value" do
  #         instance.send("#{attribute}=", value)
  #         expect(xml(instance)).to eq("<w:cols w:space=\"1\">\n    <w:col w:space=\"1\" w:w=\"1\"/>\n  </w:cols>")
  #       end
  #     end
  #
  #     context "when the value is -1" do
  #       before(:each) do
  #         @value = -1
  #       end
  #
  #       it "should accept the value" do
  #         expect { instance.send("#{attribute}=", value) }.to_not raise_error
  #       end
  #
  #       it "should output the correct value" do
  #         instance.send("#{attribute}=", value)
  #         expect(xml(instance)).to eq("<w:cols w:space=\"-1\">\n    <w:col w:space=\"1\" w:w=\"1\"/>\n  </w:cols>")
  #       end
  #     end
  #
  #     with_value(1.3) do
  #       it_should_raise_an_exception
  #     end
  #
  #     with_value(:a_lot) do
  #       it_should_raise_an_exception
  #     end
  #   end

  # end

end
