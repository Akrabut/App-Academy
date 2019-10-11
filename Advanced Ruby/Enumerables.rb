class Array
  
  def my_each(&prc)
    for i in 0..self.length-1
      prc.call(self[i])
    end 
    self
  end

  def my_select(&prc)
    newarr = []
    self.my_each do |e|
      newarr << e if prc.call(e)
    end
    newarr
  end

  def my_reject(&prc)
    newarr = []
    self.my_each do |e|
      newarr << e if !prc.call(e)
    end
    newarr
  end

  def my_any?(&prc)
    self.my_select(&prc).length > 0
  end

  def my_all?(&prc)
    self.my_reject(&prc) == []
  end

  def my_zip(*args)
    arr = []
    (self.length).times do |i1|
      temparr = [] << self[i1]
      (args.length).times do |i2|
        args[i2][i1] ? temparr << args[i2][i1] : temparr << nil
      end
      arr << temparr
    end
    arr
  end

  def my_rotate(r = 1)
    newarr = []
    self.each.with_index {|e, i| newarr[(i - r) % self.length] = e}
    newarr
  end

  def my_join(joinchar = "")
    newstr = ""
    self.each.with_index do |c, i| 
      newstr += c
      newstr += joinchar if i != self.length - 1
    end
    newstr
  end

  def my_reverse
    reversed = []
    (self.length).times {|i| reversed << self.pop}
    reversed
  end
end





#MY_REVERSE TESTING
# [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# [ 1 ].my_reverse               #=> [1]

#MY_JOIN TESTING
# a = [ "a", "b", "c", "d" ]
# a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

#MY_ROTATE TESTING
# a = [ "a", "b", "c", "d" ]
# a.my_rotate         #=> ["b", "c", "d", "a"]
# a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]

#MY_EACH TESTING
# calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
#p return_value  # => [1, 2, 3]

#MY_SELECT TESTING
# a = [1, 2, 3]
# a.my_select { |num| num > 1 } # => [2, 3]
# a.my_select { |num| num == 4 } # => []

#MY_REJECT TESTING
# a = [1, 2, 3]
# a.my_reject { |num| num > 1 } # => [1]
# a.my_reject { |num| num == 4 } # => [1, 2, 3]

#MY_ALL AND MY_ANY TESTING
# a = [1, 2, 3]
# a.my_any? { |num| num > 1 } # => true
# a.my_any? { |num| num == 4 } # => false
# a.my_all? { |num| num > 1 } # => false
# a.my_all? { |num| num < 4 } # => true

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# a.my_zip([1,2], [8])
# [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
# c = [10, 11, 12]
# d = [13, 14, 15]
# [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]