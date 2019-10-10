def partition(arr, num)
  sarr1, sarr2 = [], []
  arr.each {|e| e < num ? sarr1.push(e) : sarr2.push(e)}
  arr = []
  arr.push(sarr1).push(sarr2)
end

def merge(hash1, hash2)
  newhash = {}
  hash1.each {|k, v| newhash[k] = v}
  hash2.each {|k, v| newhash[k] = v}
  newhash
end

def censor(str, arr)
  str = str.split(" ")
  str.each.with_index do |w, i|
    if arr.include?(w.downcase)
      str[i].each_char.with_index {|c, j| str[i][j] = "*" if "aeiou".include?(c.downcase)}
    end
  end
  str.join(" ")
end

def power_of_two?(num)
  (0..num).reduce(2) do |acc, n| 
    acc ** n == num ? (return true) : acc 
  end
  false
end


