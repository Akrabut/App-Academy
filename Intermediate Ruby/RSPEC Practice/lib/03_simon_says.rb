def echo(str)
  str
end

def shout(str)
  str.upcase!
end

def repeat(str, num=1)
  newstr = "" + str
  num == 1 ? newstr += " " + str : nil
  (num-1).times {newstr += " " + str}
  newstr
end

def start_of_word(str, num)
  str[0..num-1]
end

def first_word(str)
  str = str.split(" ")[0]
end

def titleize(str)
  str = str.split(" ") 
  str[0].capitalize!
  str.each.with_index do |w, i|
    (w != "and" && w != "the" && i != 0) ? str[i].capitalize! : nil
  end
  str.join(" ")
end
p titleize("the bridge over the river kwai")

