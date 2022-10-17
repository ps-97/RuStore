# frozen_string_literal: true

require 'oj'
require 'json'

module FileStore
  class JSON
    DEFAULT_LOACTION = './storage.json'

    def initialize(location = DEFAULT_LOACTION)
      @location = location
      touch_file_if_not_present!
    end

    def read
      json_string = File.read(location)
      Oj.load(json_string)
    end

    def write(arr)
      json_string = Oj.dump(arr)
      File.write(location, json_string)
    end

    def pretty_print(obj)
      filtered_obj = obj.reject(&:empty?)

      ::JSON.pretty_generate(filtered_obj)
    end

    private

    attr_reader :location

    def touch_file_if_not_present!
      File.write(location, '[]') unless File.file?(location)
    end
  end
end
