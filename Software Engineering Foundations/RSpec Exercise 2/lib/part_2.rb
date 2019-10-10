def palindrome?(str)
  str.each_char.with_index do |c, i|
    break if i == (-1-i).abs
    return false if str[i] != str[-1-i]
  end
  true
end

def substrings(str)
  arr = []
  (0..str.length-1).each.with_index do |n1, i1|
    arr.push(str[i1])
    (i1..str.length-1).each.with_index(i1) do |n2, i2|
      next if i1 == i2
      arr.push(str[i1..i2])
    end
  end
  arr
end

def palindrome_substrings(str)
  arr = substrings(str)
  arr.select {|w| palindrome?(w) && w.length > 1}
end