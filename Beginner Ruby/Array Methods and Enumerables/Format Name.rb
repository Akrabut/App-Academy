#Write a method format_name that takes in a name string and returns the name properly capitalized.


def format_name(str)
  str = str.split(" ")
  newstr = []
  str.each do |word| 
    newstr.push(format_word(word))
  end
  newstr = newstr.join(" ")
  return newstr
end

def format_word(word)
  word.each_char.with_index do |char, i| 
    i == 0 ? word[i] = word[i].upcase : word[i] = word[i].downcase
  end
  return word
end

puts format_name("chase WILSON") # => "Chase Wilson"
puts format_name("brian CrAwFoRd scoTT") # => "Brian Crawford Scott"





