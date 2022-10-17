# frozen_string_literal: true

require_relative 'hash'
require_relative 'array'

module ARGParser
  class Factory
    class ParsingError < StandardError; end

    COMMAND_PARSER_MAP = {
      add: ARGParser::Hash,
      destroy: ARGParser::Hash,
      find: nil,
      select: ARGParser::Array
    }.freeze

    def initialize(opts)
      @opts = opts
    end

    def parse
      filtered_opts.each_with_object({}) do |(key, value), hash|
        hash[key] = COMMAND_PARSER_MAP[key]&.call(value) || value
      rescue ArgumentError
        raise ParsingError, { key => value }
      end
    end

    private

    def filtered_opts
      opts.compact.slice(*COMMAND_PARSER_MAP.keys)
    end

    attr_reader :opts
  end
end
