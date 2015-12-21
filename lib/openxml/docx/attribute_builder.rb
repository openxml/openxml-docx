module OpenXml
  module Docx
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
        def attribute(name, expects: nil, one_of: nil, displays_as: nil, namespace: nil, matches: nil)
          bad_names = %w(tag name namespace properties_tag)
          raise ArgumentError if bad_names.member? name

          attr_reader name

          define_method "#{name}=" do |value|
            valid_in?(value, one_of) unless one_of.nil?
            send(expects, value) unless expects.nil?
            matches?(value, matches) unless matches.nil?
            instance_variable_set "@#{name}", value
          end

          camelized_name = name.to_s.gsub(/_([a-z])/i) { $1.upcase }.to_sym
          attributes[name] = [displays_as || camelized_name, namespace || @attribute_namespace]
        end

        def attributes
          @attributes ||= {}
        end

        def with_namespace(namespace, &block)
          @attribute_namespace = namespace
          instance_eval(&block)
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
        attributes.each_with_object({}) do |(name, options), attrs|
          display, namespace = options
          value = send(name)
          attr_name = "#{namespace}:#{display}"
          attr_name = "#{display}" if namespace.nil?
          attrs[attr_name] = value unless value.nil?
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

      def hex_digit_4(value)
        message = "Invalid #{name}: must be a four-digit hex number, e.g. BF12"
        raise ArgumentError, message unless value =~ /[0-9A-F]{4}/
      end

      def long_hex_number(value)
        message = "Invalid #{name}: must be an eight-digit hex number, e.g., FFAC0013"
        raise ArgumentError, message unless value =~ /^[0-9A-F]{8}$/
      end

      def hex_string(value)
        message = "Invalid #{name}: must be a string of hexadecimal numbers, e.g. FFA23C6E"
        raise ArgumentError, message unless value =~ /^[0-9A-F]+$/
      end

      def integer(value)
        message = "Invalid #{name}: must be an integer"
        raise ArgumentError, message unless value.is_a?(Integer)
      end

      def positive_integer(value)
        message = "Invalid #{name}: must be a positive integer"
        raise ArgumentError, message unless value.is_a?(Integer) && value >= 0
      end

      def string(value)
        message = "Invalid #{name}: must be a string"
        raise ArgumentError, message if !value.is_a?(String) || value.length.zero?
      end

      def percentage(value)
        message = "Invalid #{name}: must be a percentage"
        raise ArgumentError, message unless value.is_a?(String) && value =~ /-?[0-9]+(\.[0-9]+)?%/ # Regex supplied in sec. 22.9.2.9 of Office Open XML docs
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
        message = "Invalid #{name}: must be one of #{list.join(", ")} (was #{value.inspect})"
        raise ArgumentError, message unless list.member?(value)
      end

      def matches?(value, regexp)
        message = "Value does not match #{regexp}"
        raise ArgumentError, message unless value =~ regexp
      end

    end
  end
end
