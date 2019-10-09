# Write a method consonant_cancel that takes in a sentence and returns a new sentence where every word begins with it's first vowel.

def consonant_cancel(sentence)
  vowels = "aeiou"
  sentence = sentence.split(" ")
  sentence.each.with_index do |word, i|
    word.each_char.with_index do |c, j|
      if vowels.include?(c)
        sentence[i] = word[j..-1]
        break
      end
    end
  end
  return sentence.join(" ")
end

puts consonant_cancel("down the rabbit hole") #=> "own e abbit ole"
puts consonant_cancel("writing code is challenging") #=> "iting ode is allenging"
