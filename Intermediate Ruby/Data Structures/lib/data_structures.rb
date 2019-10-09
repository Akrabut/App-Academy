# EASY

# Write a method that returns the range of its argument (an array of integers).
def range(arr)
  arr.max.abs + arr.min.abs
end

# Write a method that returns a boolean indicating whether an array is in sorted
# order. Use the equality operator (==), which returns a boolean indicating
# whether its operands are equal, e.g., 2 == 2 => true, ["cat", "dog"] ==
# ["dog", "cat"] => false
def in_order?(arr)
  arr == arr.sort
end


# MEDIUM

# Write a method that returns the number of vowels in its argument
def num_vowels(str)
  vowels = "aeiou"
  str.split("").select{|c| vowels.include?(c.downcase)}.length
end
  
# Write a method that returns its argument with all its vowels removed.
def devowel(str)
  vowels = "aeiou"
  str.split("").select{|c| !(vowels.include?(c.downcase))}.join("")
end

# HARD

# Write a method that returns the returns an array of the digits of a
# non-negative integer in descending order and as strings, e.g.,
# descending_digits(4291) #=> ["9", "4", "2", "1"]
def descending_digits(int)
  arr = []
  int == 0 ? (return arr.push(int.to_s)) : nil
  while int > 0
    arr.push((int % 10).to_s)
    int /= 10
  end
  arr.sort!.reverse!
end

# Write a method that returns a boolean indicating whether a string has
# repeating letters. Capital letters count as repeats of lowercase ones, e.g.,
# repeating_letters?("Aa") => true
def repeating_letters?(str)
  str.each_char.with_index do |c, i|
    (str[i+1..-1].downcase).include?(str[i].downcase) ? (return true) : (return false)
  end
end

# Write a method that converts an array of ten integers into a phone number in
# the format "(123) 456-7890".
def to_phone_number(arr)
  "(#{arr[0]}#{arr[1]}#{arr[2]}) #{arr[3]}#{arr[4]}#{arr[5]}-#{arr[6]}#{arr[7]}#{arr[8]}#{arr[9]}"
end


# Write a method that returns the range of a string of comma-separated integers,
# e.g., str_range("4,1,8") #=> 7
def str_range(str)
  arr = str.split(",").map{|i| i.to_i}
  arr.max.abs - arr.min.abs
end

#EXPERT

# Write a method that is functionally equivalent to the rotate(offset) method of
# arrays. offset=1 ensures that the value of offset is 1 if no argument is
# provided. HINT: use the take(num) and drop(num) methods. You won't need much
# code, but the solution is tricky!
def my_rotate(arr, offset=1)
  offset < 0 ? offset = arr.length + offset : nil
  arr.unshift(arr.drop(offset))
  arr.slice!(offset+1..-1)
  return arr.flatten
end

