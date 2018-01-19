module OpenXml
  module Docx
    REL_DOCUMENT = "http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument".freeze
    REL_STYLES = "http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles".freeze
    REL_SETTINGS = "http://schemas.openxmlformats.org/officeDocument/2006/relationships/settings".freeze
    REL_HEADER = "http://schemas.openxmlformats.org/officeDocument/2006/relationships/header".freeze
    REL_FOOTER = "http://schemas.openxmlformats.org/officeDocument/2006/relationships/footer".freeze
    REL_FONT_TABLE = "http://schemas.openxmlformats.org/officeDocument/2006/relationships/fontTable".freeze
    REL_FONT = "http://schemas.openxmlformats.org/officeDocument/2006/relationships/font".freeze
    REL_NUMBERING = "http://schemas.openxmlformats.org/officeDocument/2006/relationships/numbering".freeze
    REL_IMAGE = "http://schemas.openxmlformats.org/officeDocument/2006/relationships/image".freeze

    TYPE_STYLES = "application/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml".freeze
    TYPE_SETTINGS = "application/vnd.openxmlformats-officedocument.wordprocessingml.settings+xml".freeze
    TYPE_HEADER = "application/vnd.openxmlformats-officedocument.wordprocessingml.header+xml".freeze
    TYPE_FOOTER = "application/vnd.openxmlformats-officedocument.wordprocessingml.footer+xml".freeze
    TYPE_FONT_TABLE = "application/vnd.openxmlformats-officedocument.wordprocessingml.fontTable+xml".freeze
    TYPE_NUMBERING = "application/vnd.openxmlformats-officedocument.wordprocessingml.numbering+xml".freeze
    TYPE_XML = "application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml".freeze
    TYPE_OBSCURED_FONT = "application/vnd.openxmlformats-officedocument.obfuscatedFont".freeze
    TYPE_IMAGE = {
      jpeg: "image/jpeg".freeze,
      png: "image/png".freeze,
      gif: "image/gif".freeze,
      bmp: "image/bmp".freeze,
      tiff: "image/tiff".freeze
    }

    THEME_COLORS = %i(accent1 accent2 accent3 accent4 accent5 accent6 background1 background2 dark1 dark2 followedHyperlink hyperlink light1 light2 none text1 text2).freeze

    BORDER_TYPES = %i(apples archedScallops babyPacifier babyRattle balloons3Colors balloonsHotAir basicBlackDashes basicBlackDots basicBlackSquares basicThinLines basicWhiteDashes basicWhiteDots basicWhiteSquares basicWideInline basicWideMidline basicWideOutline bats birds birdsFlight cabins cakeSlice candyCorn celticKnotwork certificateBanner chainLink champagneBottle checkedBarBlack checkedBarColor checkered christmasTree circlesLines circlesRectangles classicalWave clocks compass confetti confettiGrays confettiOutlines confettiStreamers confettiWhite cornerTriangles couponCutoutDashes couponCutoutDots crazyMaze creaturesButterfly creaturesFish creaturesInsects creaturesLadyBug crossStitch cup custom dashDotStroked dashed dashSmallGap decoArch decoArchColor decoBlocks diamondsGray dotDash dotDotDash dotted double doubleD doubleDiamonds doubleWave earth1 earth2 earth3 eclipsingSquares1 eclipsingSquares2 eggsBlack fans film firecrackers flowersBlockPrint flowersDaisies flowersModern1 flowersModern2 flowersPansy flowersRedRose flowersRoses flowersTeacup flowersTiny gems gingerbreadMan gradient handmade1 handmade2 heartBalloon heartGray hearts heebieJeebies holly houseFunky hypnotic iceCreamCones inset lightBulb lightning1 lightning2 mapleLeaf mapleMuffins mapPins marquee marqueeToothed moons mosaic musicNotes nil none northwest outset ovals packages palmsBlack palmsColor paperClips papyrus partyFavor partyGlass pencils people peopleHats peopleWaving poinsettias postageStamp pumpkin1 pushPinNote1 pushPinNote2 pyramids pyramidsAbove quadrants rings safari sawtooth sawtoothGray scaredCat seattle shadowedSquares shapes1 shapes2 sharksTeeth shorebirdTracks single skyrocket snowflakeFancy snowflaskes sombrero southwest stars stars3d starsBlack starsShadowed starsTop sun swirligig thick thickThinLargeGap thickThinMediumGap thickThinSmallGap thinThickLargeGap thinThickMediumGap thinThickSmallGap thinThickThinLargeGap thinThickThinMediumGap thinThickThinSmallGap threeDEmboss threeDEngrave tornPaper tornPaperBlack trees triangle1 triangle2 triangleCircle1 triangleCircle2 triangleParty triangle triple twistedLines1 twistedLines2 vine wave waveline weavingAngles weavingBraid weavingRibbon weavingStrips whiteFlowers woodwork xIllusions zanyTriangles zigZag zigZagStitch).freeze
  end
end

require "openxml/docx/has_properties"
require "openxml/docx/properties"
require "openxml/docx/root_namespaces"
require "openxml/docx/elements"
require "openxml/docx/package"
require "openxml/docx/parts"
require "openxml/docx/section"
require "openxml/docx/style"
