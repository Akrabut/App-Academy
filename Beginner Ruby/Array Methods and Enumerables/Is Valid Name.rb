#Write a method is_valid_name that takes in a string and returns a boolean indicating whether or not it is a valid name.

# A name is valid is if satisfies all of the following:
# - contains at least a first name and last name, separated by spaces
# - each part of the name should be capitalized
#
# Hint: use str.upcase or str.downcase
# "a".upcase # => "A"


def is_valid_name(str)
  str.include?(" ") ? nil : (return false)
  str = str.split(" ")
  str.length > 1 ? nil : (return false)
  check_cases(str) ? nil : (return false)
  return true
end

def capitalized(str)
  str.each_with_index do |word, i|
    word[0].upcase == word[0] ? nil : (return false)
    word[1..-1].downcase == word[1..-1] ? nil : (return false)
  end
  return true
end

puts is_valid_name("Kush Patel")       # => true
puts is_valid_name("Daniel")           # => false
puts is_valid_name("Robert Downey Jr") # => true
puts is_valid_name("ROBERT DOWNEY JR") # => false
