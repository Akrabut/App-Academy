#Write a method most_vowels that takes in a sentence string and returns the word of the sentence that contains the most vowels.

def most_vowels(sentence)
  hash = Hash.new(0)
  sentence.split(" ").each do |word|
    hash[word] = count_vowels(word)
  end
return hash.max_by{|k, v| v}[0]
end

def count_vowels(word)
  vowels = "aeiou"
  numofvowels = 0
  word.each_char {|char| vowels.include?(char) ? numofvowels +=1 : nil}
  return numofvowels
end
print most_vowels("what a wonderful life") #=> "wonderful"
