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

    def my_all?(&block)
      self.my_each do |element|  
      return false unless block.call(element) == true
      end
      true
      end

      def my_any?(&block)
        self.my_each do |element|  
        return true if block.call(element) == true
        end
        false
        end

        def my_none?(&block)
          self.my_each do |element|  
            return false unless block.call(element) == false
          end
          true
          end

          def my_count(&block)
            count = 0
            self.my_each do |element|  
              count += 1 if block.call(element) == true
            end
            count
            end

            def my_map(&block)
              map = []
              self.my_each do |element|  
                map << block.call(element)
              end
              map
              end

              def my_inject(result,&block)
                self.my_each do |element|  
                  result = block.call(result,element)
                end
                result
                end

                def multiply_els
                  my_inject(1){|result,element| result * element }
                  end

end

include Enumerable 

my_array = [7,5,8,5,3,3,4]

 my_array.each do |n| print n+1  end

my_array.my_each do |n| print n+1  end #returns same thing


my_array.each_with_index{|item,index| print "[",index,",",item,"]" }

my_array.my_each_with_index{|item,index| print "[",index,",",item,"]" } #returns same

my_array.my_select{|num| num>5} #returns [7,8]

my_array.my_all?{|element| element % 2 == 0}  #returns false

my_array.my_any?{|element| element > 7} #returns true

my_array.my_none?{|element| element > 100} #returns true

my_array.my_count{|element| element < 7} #returns 5

my_array.my_map{|element| element %2} #returns [1, 1, 0, 1, 1, 1, 0]

my_array.my_inject(0){|result,element| result + element } #returns 35

my_array.multiply_els # returns 50,400