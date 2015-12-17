module OpenXml
  module DrawingML
    module Elements
      class PresetTextWarp < OpenXml::Docx::Elements::Container
        namespace :a
        tag :prstTxWarp

        attribute :prst, one_of: %i(textArchDown textArchDownPour textArchUp
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
      end
    end
  end
end
