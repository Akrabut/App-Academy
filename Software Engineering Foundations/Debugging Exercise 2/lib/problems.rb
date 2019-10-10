# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
  max = 0
  (1..num).each do |n|
    max = n if num % n == 0 && prime?(n)
  end
  max
end

def prime?(num)
  return false if num < 2
  (2..num-1).each {|n| return false if num % n == 0}
  return true
end

def unique_chars?(str)
  str.split("").uniq == str.split("")
end

def dupe_indices(arr)
  hash = {}
  arr.each.with_index do |e1, i1|
    temparr = []
    temparr.push(i1)
    next if hash.keys.include?(e1)
    arr.each.with_index do |e2, i2|
      next if i1 == i2
      temparr.push(i2) if e1 == e2
      hash[e1] = temparr if temparr.length > 1 && i2 == arr.length - 1
    end
  end
  hash
end

def ana_array(arr1, arr2)
  i = 0
  while i < arr1.length
    if arr2.include?(arr1[i])
      arr2.delete(arr1[i])
      arr1.delete(arr1[i])
      i-=1
    end
    i+=1
  end
  arr1 == arr2
end

ana_array(["cat", "dog", "cat"], ["dog", "cat", "cat"])