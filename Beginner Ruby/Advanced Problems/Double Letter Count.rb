# Write a method that takes in a string and returns the number of times that the same letter repeats twice in a row.

def double_letter_count(string)
  return string.split("").select.with_index{|c, i| string[i] == string[i+1]}.length
end

puts double_letter_count("the jeep rolled down the hill") #=> 3
puts double_letter_count("bootcamp") #=> 1
