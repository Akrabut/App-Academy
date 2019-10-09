# Pig latin translation uses the following rules:
# - for words that start with a vowel, add 'yay' to the end
# - for words that start with a nonvowel, move all letters before the first vowel to the end of the word and add 'ay'



def pig_latin_word(word)
  vowels = "aeiou"
  vowels.include?(word[0]) ? (return word + "yay") : nil
  word = find_first_vowel(word, vowels)
  return word
end

def find_first_vowel(word, vowels)
  word.each_char.with_index do |char, i|
    vowels.include?(char) ? (return word[i..-1] + word[0..i-1] + "ay") : nil
  end
end


puts pig_latin_word("apple")   # => "appleyay"
puts pig_latin_word("eat")     # => "eatyay"
puts pig_latin_word("banana")  # => "ananabay"
puts pig_latin_word("trash")   # => "ashtray"
