#Write a method caesar_cipher that takes in a string and a number. The method should return a new string where every character of the original is shifted num characters in the alphabet.

def caesar_cipher(str, num)
  hash = init_hash()
  #return str.split("").map! {|char| hash.key((num + hash[char]) % 26)}.join("") ---- MORE ELEGANT, BUT SLOWER!
  str.each_char.with_index do |char, i|
    str[i] = hash.key((num + hash[char]) % 26)
  end
  return str
end

def init_hash()
  hash = {}
  ('a'..'z').each.with_index do |letter, i|
    hash[letter] = i
  end
  return hash
end


puts caesar_cipher("apple", 1)    #=> "bqqmf"
puts caesar_cipher("bootcamp", 2) #=> "dqqvecor"
puts caesar_cipher("zebra", 4)    #=> "difve"
puts caesar_cipher("yyy", 4)    #=> "ccc"
