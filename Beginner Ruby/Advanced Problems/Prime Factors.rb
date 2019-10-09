#Write a method prime_factors that takes in a number and returns an array containing all of the prime factors of the given number.

def prime_factors(num)
  arr = (2...num).select {|i| num % i == 0}
  return pick_primes(arr)
end

def pick_primes(numbers)
  return numbers.select{|number| prime?(number)}
end

def prime?(num)
  num < 2 ? (return false) : nil
  (2...num).each {|i| num % i == 0 ? (return false) : nil}
  return true
end

print prime_factors(24) #=> [2, 3]
puts
print prime_factors(60) #=> [2, 3, 5]
puts
