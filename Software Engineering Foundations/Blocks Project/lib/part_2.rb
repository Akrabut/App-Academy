def all_words_capitalized?(arr)
  arr.all?{|w| w.capitalize == w}
end

def no_valid_url?(arr)
  arr.none?{|u| u.end_with?(".com") || u.end_with?(".net") || u.end_with?(".io") || u.end_with?(".org")}
end

def any_passing_students?(arr)
  arr.any?{|s| (s[:grades].reduce(0){|acc, e| acc += e}.to_f / s[:grades].length) >= 75}
end


