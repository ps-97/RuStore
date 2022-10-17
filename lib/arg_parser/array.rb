# frozen_string_literal: true

module ARGParser
  class Array
    def self.call(str)
      new(str).parse
    end

    def initialize(str)
      @str = str
    end

    def parse
      str.split(',')
    end

    private

    attr_reader :str
  end
end
