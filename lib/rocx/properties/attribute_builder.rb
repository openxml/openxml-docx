module Rocx
  module Properties
    module AttributeBuilder

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

      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def attribute(name, expects: nil, displays_as: nil)
          attr_reader name

          define_method "#{name}=" do |value|
            send(expects, value)
            instance_variable_set "@#{name}", value
          end

          camelized_name = name.to_s.gsub(/_([a-z])/i) { $1.upcase }.to_sym
          attributes[name] = displays_as || camelized_name
        end

        def attributes
          @attributes ||= {}
        end
      end

      def render?
        attributes.keys.map(&method(:send)).any?
      end

      def attributes
        self.class.attributes
      end

    private

      def xml_attributes
        attributes.each_with_object({}) do |(name, display), attrs|
          value = send(name)
          attrs["w:#{display}"] = value if value
        end
      end

      def true_or_false(value)
        message = "Invalid #{name}: frame must be true or false"
        raise ArgumentError, message unless [true, false].member? value
      end

      def hex_color(value)
        message = "Invalid #{name}: must be :auto or a hex color, e.g. 4F1B8C"
        raise ArgumentError, message unless value == :auto || value =~ /[0-9A-F]{6}/
      end

      def hex_digit(value)
        message = "Invalid #{name}: must be a two-digit hex number, e.g. BF"
        raise ArgumentError, message unless value =~ /[0-9A-F]{2}/
      end

      def integer(value)
        message = "Invalid #{name}: must be an integer"
        raise ArgumentError, message unless value.is_a?(Integer)
      end

      def positive_integer(value)
        message = "Invalid #{name}: must be a positive integer"
        raise ArgumentError, message unless value.is_a?(Integer) && value >= 0
      end

      def on_or_off(value)
        valid_in? value, [:on, :off]
      end

      def valid_theme_color(value)
        valid_in? value, VALID_THEME_COLORS
      end

      def valid_type(value)
        valid_in? value, VALID_TYPES
      end

      def valid_in?(value, list)
        message = "Invalid #{name}: must be one of #{list.join(", ")}"
        raise ArgumentError, message unless list.member?(value)
      end

    end
  end
end
