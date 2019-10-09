#Write a method abbreviate_sentence that takes in a sentence string and returns a new sentence where every word longer than 4 characters has all of it's vowels removed.

def abbreviate_sentence(sent)
  sent = sent.split(" ")
  newsent = ""
	sent.each do |ele| 
      ele.length > 4 ? newsent += abbreviate_word(ele) : newsent += ele
      newsent += " "
    end
  return newsent
end

def abbreviate_word(word)
  vowels = "aeiou"
  newword = ""
  word.each_char do |char|
    vowels.include?(char) ? nil : newword += char
  end
  return newword
end

puts abbreviate_sentence("follow the yellow brick road") # => "fllw the yllw brck road"
puts abbreviate_sentence("what a wonderful life")        # => "what a wndrfl life"
