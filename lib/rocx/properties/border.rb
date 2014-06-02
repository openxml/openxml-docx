module Rocx
  module Properties
    class Border
      include AttributeBuilder

      attr_reader :tag

      VALID_THEME_COLORS = %i(accent1 accent2 accent3 accent4 accent5 accent6 background1 background2 dark1 dark2 followedHyperlink hyperlink light1 light2 none text1 text2)

      VALID_TYPES = %i(apples
                       archedScallops
                       babyPacifier
                       babyRattle
                       balloons3Colors
                       balloonsHotAir
                       basicBlackDashes
                       basicBlackDots
                       basicBlackSquares
                       basicThinLines
                       basicWhiteDashes
                       basicWhiteDots
                       basicWhiteSquares
                       basicWideInline
                       basicWideMidline
                       basicWideOutline
                       bats
                       birds
                       birdsFlight
                       cabins
                       cakeSlice
                       candyCorn
                       celticKnotwork
                       certificateBanner
                       chainLink
                       champagneBottle
                       checkedBarBlack
                       checkedBarColor
                       checkered
                       christmasTree
                       circlesLines
                       circlesRectangles
                       classicalWave
                       clocks
                       compass
                       confetti
                       confettiGrays
                       confettiOutlines
                       confettiStreamers
                       confettiWhite
                       cornerTriangles
                       couponCutoutDashes
                       couponCutoutDots
                       crazyMaze
                       creaturesButterfly
                       creaturesFish
                       creaturesInsects
                       creaturesLadyBug
                       crossStitch
                       cup
                       custom
                       dashDotStroked
                       dashed
                       dashSmallGap
                       decoArch
                       decoArchColor
                       decoBlocks
                       diamondsGray
                       dotDash
                       dotDotDash
                       dotted
                       double
                       doubleD
                       doubleDiamonds
                       doubleWave
                       earth1
                       earth2
                       earth3
                       eclipsingSquares1
                       eclipsingSquares2
                       eggsBlack
                       fans
                       film
                       firecrackers
                       flowersBlockPrint
                       flowersDaisies
                       flowersModern1
                       flowersModern2
                       flowersPansy
                       flowersRedRose
                       flowersRoses
                       flowersTeacup
                       flowersTiny
                       gems
                       gingerbreadMan
                       gradient
                       handmade1
                       handmade2
                       heartBalloon
                       heartGray
                       hearts
                       heebieJeebies
                       holly
                       houseFunky
                       hypnotic
                       iceCreamCones
                       inset
                       lightBulb
                       lightning1
                       lightning2
                       mapleLeaf
                       mapleMuffins
                       mapPins
                       marquee
                       marqueeToothed
                       moons
                       mosaic
                       musicNotes
                       nil
                       none
                       northwest
                       outset
                       ovals
                       packages
                       palmsBlack
                       palmsColor
                       paperClips
                       papyrus
                       partyFavor
                       partyGlass
                       pencils
                       people
                       peopleHats
                       peopleWaving
                       poinsettias
                       postageStamp
                       pumpkin1
                       pushPinNote1
                       pushPinNote2
                       pyramids
                       pyramidsAbove
                       quadrants
                       rings
                       safari
                       sawtooth
                       sawtoothGray
                       scaredCat
                       seattle
                       shadowedSquares
                       shapes1
                       shapes2
                       sharksTeeth
                       shorebirdTracks
                       single
                       skyrocket
                       snowflakeFancy
                       snowflaskes
                       sombrero
                       southwest
                       stars
                       stars3d
                       starsBlack
                       starsShadowed
                       starsTop
                       sun
                       swirligig
                       thick
                       thickThinLargeGap
                       thickThinMediumGap
                       thickThinSmallGap
                       thinThickLargeGap
                       thinThickMediumGap
                       thinThickSmallGap
                       thinThickThinLargeGap
                       thinThickThinMediumGap
                       thinThickThinSmallGap
                       threeDEmboss
                       threeDEngrave
                       tornPaper
                       tornPaperBlack
                       trees
                       triangle1
                       triangle2
                       triangleCircle1
                       triangleCircle2
                       triangleParty
                       triangle
                       triple
                       twistedLines1
                       twistedLines2
                       vine
                       wave
                       waveline
                       weavingAngles
                       weavingBraid
                       weavingRibbon
                       weavingStrips
                       whiteFlowers
                       woodwork
                       xIllusions
                       zanyTriangles
                       zigZag
                       zigZagStitch)

      attribute :color, expects: :hex_color
      attribute :frame, expects: :true_or_false
      attribute :shadow, expects: :true_or_false
      attribute :size, expects: :positive_integer, displays_as: :sz
      attribute :space, expects: :positive_integer
      attribute :theme_color, expects: :valid_theme_color, displays_as: :themeColor
      attribute :theme_shade, expects: :hex_digit, displays_as: :themeShade
      attribute :theme_tint, expects: :hex_digit, displays_as: :themeTint
      attribute :type, expects: :valid_type, displays_as: :val

      def initialize(tag)
        @tag = tag
      end

      def name
        "border"
      end

      def to_xml(xml)
        xml["w"].public_send(tag, xml_attributes)
      end

    private

      def valid_theme_color(value)
        valid_in? value, VALID_THEME_COLORS
      end

      def valid_type(value)
        valid_in? value, VALID_TYPES
      end

    end
  end
end
