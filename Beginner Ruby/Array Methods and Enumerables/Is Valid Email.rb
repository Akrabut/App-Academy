#Write a method is_valid_email that takes in a string and returns a boolean indicating whether or not it is a valid email address.

# For simplicity, we'll consider an email valid when it satisfies all of the following:
# - contains exactly one @ symbol
# - contains only lowercase alphabetic letters before the @
# - contains exactly one . after the @

def is_valid_email(str)
  str.count("@") == 1 ? nil : (return false)
  at = at_index(str)
  check_dot(str, at) ? nil : (return false)
  check_numbers(str, at) ? (return true) : (return false)
end

def at_index(str)
  at = ""
  str.each_char.with_index do |char, i|
    str[i] == "@" ? at = i : nil
  end
  return at
end

def check_dot(str, at)
  str[at..-1].count(".") == 1 ? (return true) : (return false)
end

def check_numbers(str, at)
  alphabet = "qwertyuiopasdfghjklzxcvbnm"
  str[0..at-1].each_char do |char|
    alphabet.include?(char) ? nil : (return false)
  end
  return true
end

puts is_valid_email("abc@xy.z")         # => true
puts is_valid_email("jdoe@gmail.com")   # => true
puts is_valid_email("jdoe@g@mail.com")  # => false
puts is_valid_email("jdoe42@gmail.com") # => false
puts is_valid_email("jdoegmail.com")    # => false
puts is_valid_email("az@email")         # => false
