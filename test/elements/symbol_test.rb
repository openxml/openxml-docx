require "test_helper"

class SymbolTest < Test::Unit::TestCase
  attr_reader :symbol

  should "require that its char property be 4 hexadecimal characters" do
    @symbol = Rocx::Elements::Symbol.new
    assert_raises ArgumentError do
      symbol.char = "not valid"
    end

    assert_nothing_raised do
      symbol.char = "43fd"
    end
  end

  should "output the right XML" do
    @symbol = Rocx::Elements::Symbol.new(char: "43fd", font: "Wingdings")
    xml = build_xml { |xml| symbol.to_xml(xml) }
    assert_equal element_xml("symbol"), xml
  end

end
