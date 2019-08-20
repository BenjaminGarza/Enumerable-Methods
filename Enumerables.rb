module Enumerable
  def my_each
    i = 0
    while i < self.length
    yield(self[i])
    i += 1
    end
  return self
  end

  def my_each_with_index
    i = 0
    while i < self.length
    index = i
    yield(self[i], index)
    i += 1
    end
  return self
  end

  def my_select(&block) 
    result = []
    self.my_each do |element|
    result << element if block.call(element) == true 
    end
    result
    end

end

include Enumerable 

my_array = [7,5,8,5,3,3,4]

 my_array.each do |n| print n+1  end

my_array.my_each do |n| print n+1  end #returns same thing


my_array.each_with_index{|item,index| print "[",index,",",item,"]" }

my_array.my_each_with_index{|item,index| print "[",index,",",item,"]" } #returns same

my_array.my_select{|num| num>5} #returns [7,8]