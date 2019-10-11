# disfunctional but O(n!)
def first_anagram?(str1, str2)
  arr = []
  (str1.length + 1).times do |i|
    next if i.zero?
    arr << str1.split("").permutation(i).to_a
  end
  arr.include?(str2.split(""))
end

# O(n^2)
def second_anagram?(str1, str2)
  arr = str2.split("")
  str1.each_char do |c|
    arr.delete_at(arr.find_index(c))
  end
  arr.empty?
end

# O(nlogn)
def third_anagram?(str1, str2)
  str1.split("").sort == str2.split("").sort
end

# O(n)
def build_hash(str1)
  hash = Hash.new(0)
  str1.each_char { |c| hash[c] += 1 }
  hash
end

# O(n) + O(n)
def anagram?(str1, str2)
  hash = build_hash(str1)
  str2.each_char { |c| hash[c] -= 1 }
  hash.all? { |_, v| v.zero? }
end

p first_anagram?("elvis", "lives")
p second_anagram?("elvis", "lives")
p third_anagram?("elvis", "lives")
p anagram?("elvis", "lives")