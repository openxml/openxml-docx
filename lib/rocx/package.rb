module Rocx
  class Package

    attr_reader :core,
                :rels,
                :web_settings

    def initialize
      @core = Rocx::Parts::Core.new
      @rels = Rocx::Parts::Rels.new
      @web_settings = Rocx::Parts::WebSettings.new
    end

  end
end
