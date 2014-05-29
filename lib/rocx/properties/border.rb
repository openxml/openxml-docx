module Rocx
  module Properties
    class Border
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

      class << self
        def attribute(name, expects: nil, displays_as: nil)
          attr_reader name

          define_method "#{name}=" do |value|
            send(expects, name, value)
            instance_variable_set "@#{name}", value
          end

          attributes << name
        end

        def attributes
          @attributes ||= []
        end
      end

      attribute :color, expects: :hex_color
      attribute :frame, expects: :true_or_false
      attribute :shadow, expects: :true_or_false
      attribute :size, expects: :positive_integer
      attribute :space, expects: :positive_integer
      attribute :theme_color, expects: :valid_theme_color
      attribute :theme_shade, expects: :hex_digit
      attribute :theme_tint, expects: :hex_digit
      attribute :type, expects: :valid_type

      def initialize(tag)
        @tag = tag
      end

      def name
        "border"
      end

      def render?
        attributes.map(&method(:send)).any?
      end

      def to_xml(xml)
        xml["w"].public_send(tag, xml_attributes)
      end

    private

      def xml_attributes
        attrs = {}
        attrs["w:color"] = color if color
        attrs["w:frame"] = frame if frame
        attrs["w:shadow"] = shadow if shadow
        attrs["w:space"] = space if space
        attrs["w:sz"] = size if size
        attrs["w:themeColor"] = theme_color if theme_color
        attrs["w:themeShade"] = theme_shade if theme_shade
        attrs["w:themeTint"] = theme_tint if theme_tint
        attrs["w:val"] = type if type
        attrs
      end

      def attributes
        self.class.attributes
      end

      def hex_color(name, value)
        message = "Invalid #{name}: must be :auto or a hex color, e.g. 4F1B8C"
        raise ArgumentError, message unless value == :auto || value =~ /[0-9A-F]{6}/
      end

      def hex_digit(name, value)
        message = "Invalid #{name}: must be a two-digit hex number, e.g. BF"
        raise ArgumentError, message unless value =~ /[0-9A-F]{2}/
      end

      def positive_integer(name, value)
        message = "Invalid #{name}: must be a positive integer"
        raise ArgumentError, message unless value.is_a?(Integer) && value >= 0
      end

      def valid_theme_color(name, value)
        message = "Invalid #{name}: must be one of #{VALID_THEME_COLORS.join(", ")}"
        raise ArgumentError, message unless VALID_THEME_COLORS.member? value
      end

      def valid_type(name, value)
        message = "Invalid #{name}: must be one of #{VALID_TYPES.join(", ")}"
        raise ArgumentError, message unless VALID_TYPES.member? value
      end

      def true_or_false(name, value)
        message = "Invalid #{name}: frame must be true or false"
        raise ArgumentError, message unless [true, false].member? value
      end

    end
  end
end
