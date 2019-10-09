#Write a method frequent_letters that takes in a string and returns an array containing the characters that appeared more than twice in the string.

def frequent_letters(string)
	hash =Hash.new(0)
  arr = []
  string.each_char do |char|
    hash[char] += 1
  hash[char] > 2 ? arr.push(char) : nil
  end
  return arr.uniq!
end

print frequent_letters('mississippi') #=> ["s", "i"]
puts
print frequent_letters('bootcamp') #=> []
puts
