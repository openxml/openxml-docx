module Rocx
  class Package
    attr_reader :content_types,
                :document,
                :rels,
                :settings

    def initialize
      @content_types = Rocx::Parts::ContentTypes.new
      @document = Rocx::Parts::Document.new
      @rels = Rocx::Parts::Rels.new
      @settings = Rocx::Parts::Settings.new
    end

  end
end
