module Rocx
  class Package
    attr_reader :content_types,
                :document,
                :global_rels,
                :rels,
                :settings,
                :styles

    def initialize
      @content_types = Rocx::Parts::ContentTypes.new
      @document = Rocx::Parts::Document.new
      @global_rels = Rocx::Parts::GlobalRels.new
      @rels = Rocx::Parts::Rels.new
      @settings = Rocx::Parts::Settings.new
      @styles = Rocx::Parts::Styles.new
    end

  end
end
