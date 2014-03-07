module Rocx
  class Package

    attr_reader :core

    def initialize
      @core = Rocx::Parts::Core.new
    end

  end
end
