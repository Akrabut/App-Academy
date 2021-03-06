#Write a method unique_elements that takes in an array and returns a new array where all duplicate elements are removed. Solve this using a hash.

# Hint: all keys of a hash are automatically unique

def unique_elements(arr)
  hash = Hash.new(0)
  array = []
  arr.each do |ele|
    hash[ele] +=1
    hash[ele] == 1 ? array.push(ele) : nil
  end
  return array
end

print unique_elements(['a', 'b', 'a', 'a', 'b', 'c']) #=> ["a", "b", "c"]
puts
