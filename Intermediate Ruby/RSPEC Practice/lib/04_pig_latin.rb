def translate(s)
  s = s.split(" ")
  s = s.map {|w| pig_latinize(w)}
  s.join(" ")
end

def pig_latinize(s)
  vowels = "aeiou"
  qu = "qu"
  (!vowels.include?(s[0]) && !vowels.include?(s[1]) && !vowels.include?(s[2])) || qu.include?(s[1..2]) ? (return s[3..-1]+s[0..2]+"ay") : nil
  (!vowels.include?(s[0]) && !vowels.include?(s[1])) || qu.include?(s[0..1]) ? (return s[2..-1]+s[0..1]+"ay") : nil
  vowels.include?(s[0]) ? (return s+"ay") : (return s[1..-1]+s[0]+"ay")
end

