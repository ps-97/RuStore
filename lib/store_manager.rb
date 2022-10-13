# frozen_string_literal: true

class StoreManager
  def initialize(storage)
    @storage = storage
  end

  def add!(record_hash)
    return if records.find { |obj| obj == record_hash }

    temp_state = records + [record_hash]
    write_to_store(temp_state)
  end

  def destroy!(key:, value:)
    temp_state = records.reject { |obj| obj[key] == value }
    write_to_store(temp_state)
  end

  def filter_by_value(value, keys_to_select: nil)
    filtered_arr = records.select { |obj| obj.value?(value) }
    return filtered_arr unless keys_to_select

    slice_keys(filtered_arr, keys_to_select)
  end

  private

  attr_reader :storage

  def slice_keys(arr, keys_to_select = nil)
    arr.map { |hash| hash.slice(*keys_to_select) }
  end

  def records
    storage.read
  end

  def write_to_store(temp_state)
    storage.write(temp_state)
  end
end
