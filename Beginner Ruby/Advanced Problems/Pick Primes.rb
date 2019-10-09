#Write a method pick_primes that takes in an array of numbers and returns a new array containing only the prime numbers.

def prime?(num)
  num < 2 ? (return false) : nil
  (2...num).each {|i| num % i == 0 ? (return false) : nil}
  return true
end

def pick_primes(numbers)
  return numbers.select{|number| prime?(number)}
end


print pick_primes([2, 3, 4, 5, 6]) #=> [2, 3, 5]
puts
print pick_primes([101, 20, 103, 2017]) #=> [101, 103, 2017]
puts
