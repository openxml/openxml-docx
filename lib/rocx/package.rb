module Rocx
  class Package
    attr_reader :content_types,
                :document,
                :rels,
                :settings,
                :styles

    def initialize
      @content_types = Rocx::Parts::ContentTypes.new
      @document = Rocx::Parts::Document.new
      @rels = Rocx::Parts::Rels.new
      @settings = Rocx::Parts::Settings.new
      @styles = Rocx::Parts::Styles.new
    end

  end
end
