# Write a method that capitalizes each word in a string like a book title
# Do not capitalize words like 'a', 'and', 'of', 'over' or 'the'.

LITTLE_WORDS = [
  "and",
  "the",
  "over"
]

def titleize(title)
  words = title.split(" ")
  titleized_words = words.map.with_index do |word, i|
    if (i == 0)
      capitalize_word(word)
    elsif (i != 0 && !LITTLE_WORDS.include?(word))
      capitalize_word(word)
    else
      word.downcase
    end
  end
  titleized_words.join(" ")
end

def capitalize_word(word)
  word[0] = word[0].capitalize
  word
end

# Write a method that returns the largest prime factor of a given integer.

def prime?(num)
  (2..num-1).none? { |factor| num % factor == 0 }
end


def largest_prime_factor(num)
  num == 0 || num == 1 ? (return nil) : nil
  num.downto(2) do |factor|
    if (num % factor).zero?
      return factor if prime?(factor)
    end
  end
end



# Write a symmetric_substrings method that takes a string and returns an array
# of substrings that are palindromes, e.g. symmetric_substrings("cool") => ["oo"]
# Only include substrings of length > 1.

# def symmetric_substrings(str)
#   symm_subs = ""
#   str.length.times do |start_pos|
#     (2..(str.length - start_pos)).each do |len|
#       substr = str[start_pos...(start_pos + len)]
#       if substr == substr.reverse
#         symm_subs << substr
#       end
#     end
#   symm_subs
# end
# end



def is_palindrome?(str)
  str == str.reverse
end

def find_num(str)
  str.each_char do |c|
    c.to_s == c.to_i.to_s ? (str = str.split(c)) : next
  end
  str
end

def handle_array(arr)
  arr.map {|w| symmetric_substrings(w)}.flatten
end

def symmetric_substrings(str)
  find_num(str).is_a?(Array) ? (return handle_array(find_num(str))) : nil
  substr = ""
  arr = []
  (str.length/2).times.with_index do |c, i|
    substr = str[i..-1-i]
    is_palindrome?(substr) ? arr.unshift(substr) : next
  end
  arr
end


# Write a method that returns `true` if all characters in the string
# are unique and `false` if they are not.


def all_unique_chars?(str)
  letters = str.split('').reject{ |char| char == '  '}
  letters.uniq.length == letters.length
end

