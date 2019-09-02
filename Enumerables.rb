# frozen_string_literal: true

module Enumerable
  def my_each
    i = 0
    array = entries
    while i < array.length
      yield(array[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < length
      index = i
      yield(self[i], index)
      i += 1
    end
    self
  end

  def my_select(&block)
    result = []
    my_each do |element|
      result << element if block.call(element) == true
    end
    result
  end

  def my_all?(&block)
    my_each do |element|
      return false unless block_given? == true && block.call(element) == true
    end
    true
  end

  def my_any?(&block)
    my_each do |element|
      if block_given? == true
        return true if block.call(element) == true
      else
        return true if element == true
      end
    end
    false
  end

  def my_none?(&block)
    my_each do |element|
      if block_given? == true
        return false unless block.call(element) == false
      else
        return false unless element == false
      end
    end
    true
  end

  def my_count(check = nil, &block)
    count = 0
    if !check.nil?
      my_each do |element|
        count += 1 if check == element
      end
    else
      if block_given? == true
        my_each do |element|
          count += 1 if block.call(element) == true
        end
      else
        my_each { count += 1 }
      end
    end
    count
  end

  def my_map(&block)
    map = []
    my_each do |element|
      map << block.call(element)
    end
    map
  end

  def my_inject(accumulator = 0, &block)
    if accumulator == 0
      result = self[0]
      if block_given? == true
        (1...length).my_each do |index|
          result = block.call(result, self[index])
        end
      end
    else
      result = accumulator
      (0...length).my_each do |index|
        result = block.call(result, self[index])
      end
    end
    result
  end

  def multiply_els
    my_inject { |result, element| result * element }
end

  def my_map_v2(proc = nil)
    (0...length).each do |i|
      self[i] = proc.call self[i] unless proc.nil?
      self[i] = yield(self[i]) if proc.nil?
    end
    self
  end
end
