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
