# frozen_string_literal: true

module ARGParser
  class Hash
    def self.call(str)
      new(str).parse
    end

    def initialize(str)
      @str = str
    end

    def parse
      str.split(',').to_h { |obj| obj.split(':') }
    end

    private

    attr_reader :str
  end
end
