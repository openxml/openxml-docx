require "spec_helper"

describe OpenXml::DrawingML::Elements::PresetTextWarp do
  include ElementTestMacros
  it_should_use tag: :prstTxWarp, name: "preset_text_warp"

  presets = %i(textArchDown textArchDownPour textArchUp
              textArchUpPour textButton textButtonPour
              textCanDown textCanUp textCascadeDown
              textCascadeUp textChevron textChevronInverted
              textCircle textCirclePour textCurveDown
              textCurveUp textDeflate textDeflateBottom
              textDeflateInflate textDeflateTop
              textDoubleWave1 textFadeDown textFadeLeft
              textFadeRight textFadeUp textInflate
              textInflateBottom textInflateTop textNoShape
              textPlain textRingInside textRingOutside
              textSlantDown textSlantUp textStop textTriangle
              textTriangleInverted textWave1 textWave2
              textWave4)

  for_attribute(:preset) do
    presets.each do |preset|
      with_value(preset) do
        it_should_assign_successfully
        it_should_output "<a:prstTxWarp prst=\"#{preset}\"/>"
      end
    end

    with_values([1, false, :incorrect]) do
      it_should_raise_an_exception
    end

  end

end
