module Rocx
  class Package

    attr_reader :content_types,
                :core,
                :document,
                :rels,
                :web_settings

    def initialize
      @content_types = Rocx::Parts::ContentTypes.new
      @core = Rocx::Parts::Core.new
      @document = Rocx::Parts::Document.new
      @rels = Rocx::Parts::Rels.new
      @web_settings = Rocx::Parts::WebSettings.new
    end

  end
end
