# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
  str.split("").select{|c| c==c.upcase}.join("")
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  str.length % 2 == 0 ? (return "#{str[str.length/2 - 1]}#{str[str.length/2]}") : (return "#{str[str.length/2]}")
end

# Return the number of vowels in a string.
VOWELS = %w(a e i o u)
def num_vowels(str)
  count = 0
  str.each_char {|c| VOWELS.include?(c) ? count+=1 : next}
  count
end



# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
  fact = 1
  (1..num).each {|x| fact *= x}
  fact
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
  str = ""
  arr.each {|e| e == arr.last ? str += e.to_s : str += e.to_s + separator}
  str
end


# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  str.each_char.with_index {|c, i| i.even? ? str[i] = c.downcase : str[i] = c.upcase}
end



# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
  str = str.split(" ")
  str.each.with_index {|w, i| w.length >= 5 ? str[i].reverse! : next}.join(" ")
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
  arr = []
  (1..n).each do |i|
    if (i % 3 == 0 && i % 5 == 0)  
      arr[i-1] = "fizzbuzz"
      next
    elsif i % 3 == 0 
      arr[i-1] = "fizz" 
      next
    elsif i % 5 == 0
      arr[i-1] = "buzz" 
      next
    else
    arr[i-1] = i
    end
  end
  arr
end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
  newarr = []
  arr.each {|i| newarr.unshift(i)}
  newarr
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
  num == 1 ? (return false) : nil
  (2...num).each {|n| num % n == 0 ? (return false) : nil}
  true
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  arr = []
  (1..num).each {|n| num % n == 0 ? arr.push(n) : next}
  arr
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
  factors(num).select{|n| prime?(n)}
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
  prime_factors(num).length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
  num_of_odd = 0
  num_of_even = 0
  arr.each do |n|
    n.odd? ? num_of_odd+=1 : num_of_even+=1
  end
  if num_of_odd == 1
    arr.each {|n| n.odd? ? (return n) : next}
  elsif num_of_even == 1
    arr.each {|n| n.even? ? (return n) : next}
  else return nil
  end
end
