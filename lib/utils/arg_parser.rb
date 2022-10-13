# frozen_string_literal: true

module Utils
  # Convert arguments from commandline to ruby objects.
  # a,b,c will be converted into ["a", "b", "c"]
  # a=b,b=c,c=d will be converted ingo { "a" => "b", "b" => "c", "c" => "d" }
  class ArgParser
    class InvalidArgError < StandardError; end

    HASH_REGEX = /(([^\s,=]+:[^\s,=]+)(?:,\s*)?)+/
    ARRAY_REGEX = /(.+?)(?:,|$)/

    def initialize(str)
      @str = str
    end

    def parse
      case str
      when HASH_REGEX
        parse_to_hash
      when ARRAY_REGEX
        parse_to_array
      else
        raise InvalidArgError, 'Invalid argument'
      end
    end

    private

    attr_reader :str

    def parse_to_hash
      parse_to_array
        .to_h { |obj| obj.split(':') }
    end

    def parse_to_array
      str.split(',')
    end
  end
end
