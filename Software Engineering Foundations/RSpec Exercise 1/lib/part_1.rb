def average(n1, n2)
  (n1.to_f + n2) / 2
end

def average_array(arr)
  arr.sum.to_f/arr.count
end

def repeat(str, n)
  str *= n
end

def yell(str)
  str.upcase + "!"
end

def alternating_case(str)
  newstr = ""
  str.split(" ").each.with_index {|w, i| i % 2 == 0 ? newstr += w.upcase + " " : newstr += w.downcase + " "}.join(" ")
  newstr
end

p alternating_case("code never lies, comments sometimes do.")
p alternating_case("HEY PROGRAMMERS")