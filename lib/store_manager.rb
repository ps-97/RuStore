# frozen_string_literal: true

class StoreManager
  SUB_COMMANDS_MAP = {
    find: %i[select]
  }.freeze

  attr_reader :records

  def initialize(storage)
    @storage = storage
    @records = storage.read
  end

  def add(record_hash)
    return if records.find { |record| record == record_hash }

    records << record_hash
    write_to_store!
  end

  def destroy(opts)
    opts.each_pair do |key, value|
      records.reject! { |record| record[key] == value }
    end
    write_to_store!
  end

  def find(value)
    records.select! { |record| record.value?(value) }
  end

  def select(keys)
    records.map! { |record| record.slice(*keys) }
  end

  def to_s
    storage.pretty_print(records)
  end

  private

  attr_reader :storage

  def write_to_store!
    storage.write(records)
    reload
  end

  def reload
    @records = storage.read
  end
end
