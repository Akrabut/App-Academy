# O(n^2)
def bad_two_sum?(arr, sum)
  arr.each.with_index do |e1, i1|
    arr.each.with_index do |e2, i2|
      next if i1 == i2
      return true if e1 + e2 == sum
    end
  end
  false
end

# O(nlogn) for the sort, O(logn) for the binary search
def okay_two_sum?(arr, sum)
  return false if arr.length == 1
  arr.sort!
  check_sum = arr[arr.length/2] + arr[arr.length/2+1]
  return true if arr[arr.length/2] + arr[arr.length/2+1] == sum 
  okay_two_sum?(arr[0..arr.length/2], sum) if check_sum < sum
  okay_two_sum?(arr[0..arr.length/2], sum) if check_sum > sum
end

def two_sum?(arr, sum)
  hash = arr.reduce(Hash.new(0)) { |hash, e| hash[e] += 1; hash }
  hash.values.any? { |v| hash[sum - v] > 0 }
end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false
p okay_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false