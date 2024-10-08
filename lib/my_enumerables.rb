module Enumerable
  def my_each_with_index 
    i = 0
    my_each do |item|
      yield(item, i)
      i += 1
    end
  end

  def my_select
    selected_items = []
    my_each do |item|
      selected_items.push(item) if yield(item)
    end
    selected_items
  end

  def my_all?
    my_each do |item|
      return false unless yield(item)
    end
    true
  end

  def my_any?
    my_each do |item|
      return true if yield(item)
    end
    false
  end

  def my_none?
    my_each do |item|
      return false if yield(item)
    end
    true
  end

  def my_count
    count = 0
    my_each do |item|
      count += 1 if !block_given? || yield(item)
    end
    count
  end

  def my_map
    mapped_items = []
    my_each do |item|
      mapped_items.push(yield(item))
    end
    mapped_items
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for item in self
      yield item 
    end
  end
end
