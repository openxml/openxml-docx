module Rocx
  class Package

    attr_reader :core, :web_settings

    def initialize
      @core = Rocx::Parts::Core.new
      @web_settings = Rocx::Parts::WebSettings.new
    end

  end
end
