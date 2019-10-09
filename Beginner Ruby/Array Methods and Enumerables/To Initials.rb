#Write a method to_initials that takes in a person's name string and returns a string representing their initials.

def to_initials(name)
	arr = name.split(" ")
  arr.each_with_index do |ele, i|
    arr[i]=ele[0]
  end
  arr = arr.join("")
  return arr
end


puts to_initials("Kelvin Bridges")      # => "KB"
puts to_initials("Michaela Yamamoto")   # => "MY"
puts to_initials("Mary La Grange")      # => "MLG"
