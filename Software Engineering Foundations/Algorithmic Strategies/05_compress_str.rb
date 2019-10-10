# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
  newstr = ""
  lastc = ""
  str.each_char.with_index do |c, i|
    next if lastc == c
    lastc = c
    newstr += count_reps(str[i..-1])
    newstr += lastc
  end
  newstr
end

def count_reps(str)
  reps = 1
  str.each_char.with_index do |c, i|
    break if str[i+1] != c || str[i+1] == nil
    reps += 1 if str[i+1] == c
  end
  reps > 1 ? reps.to_s : ""
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
