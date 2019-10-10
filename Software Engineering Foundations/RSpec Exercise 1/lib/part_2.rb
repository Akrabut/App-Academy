def hipsterfy(str)
  lastv = ""
  str.each_char.with_index {|c, i| lastv = i if "aeiou".include?(c)}
  str.slice!(lastv)
  str
end

def vowel_counts(str)
  hash = Hash.new(0)
  str.each_char {|c| hash[c.downcase] += 1 if "aeoiu".include?(c.downcase)}
  hash
end

def caesar_cipher(str, moves)
  hash = init_hash
  str.each_char.with_index {|c, i| str[i] = hash[(hash.key(c) + moves) % 26] if hash.key(c)}
  str
end

def init_hash
  hash = {}
  ("a".."z").each.with_index {|c, i| hash[i] = c}
  hash
end

