#Write a method vowel_cipher that takes in a string and returns a new string where every vowel becomes the next vowel in the alphabet.

def vowel_cipher(string)
  vowels = "aeiou"
  string.each_char.with_index do |c, i|
    vowels.include?(c) ? string[i] = get_vowel(c) : next
  end
  return string
end

def get_vowel(vowel)
  case vowel
  when "a"
    return "e"
  when "e"
    return "i"
  when "i"
    return "o"
  when "o"
    return "u"
  when "u"
    return "a"
  end
end

puts vowel_cipher("bootcamp") #=> buutcemp
puts vowel_cipher("paper cup") #=> pepir cap
