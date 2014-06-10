module PartTestMacros

  def xml(part)
    File.read(File.join(File.dirname(__FILE__), "data", "parts", "#{part}_part.xml")).strip
  end

  def self.included(base)
    attr_reader :doc
    base.extend ClassMethods
  end

  module ClassMethods

    def it_should_output_correct_xml(part: nil)
      it "should be able to output the correct XML" do
        if part.nil?
          part = described_class.to_s.split(/::/).last
          part = part.gsub(/(.)([A-Z])/, '\1_\2').downcase
        end

        expect(doc.read).to eq(xml(part))
      end
    end

  end

end
