# Write a method, is_sorted(arr), that accepts an array of numbers as an arg.
# The method should return true if the elements are in increasing order, false otherwise.
# Do not use the built-in Array#sort in your solution :)

def is_sorted(arr)
  arr.each.with_index do |e, i|
    return false if !is_all?(arr[i..-1]) 
  end
  true
end

def is_all?(arr)
  arr.all? {|e| arr[0] <= e}
end

p is_sorted([1, 4, 10, 13, 15])       # => true
p is_sorted([1, 4, 10, 10, 13, 15])   # => true
p is_sorted([1, 2, 5, 3, 4 ])         # => false
