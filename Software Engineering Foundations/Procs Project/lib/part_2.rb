def reverser(str, &blk)
  str.reverse!
  blk.call(str)
end

def word_changer(str, &blk)
  str = str.split(" ")
  str.map {|x| blk.call(x)}.join(" ")
end

def greater_proc_value(num, prc1, prc2)
  prc1.call(num) > prc2.call(num) ? prc1.call(num) : prc2.call(num)
end

def and_selector(arr, prc1, prc2)
  newarr = []
  arr.each {|x| newarr.push(x) if prc1.call(x) && prc2.call(x)}
  newarr
end

def alternating_mapper(arr, prc1, prc2)
  newarr = []
  arr.each.with_index do |x, i|
    i % 2 == 0 ? newarr << prc1.call(x) : newarr << prc2.call(x)
  end
  newarr
end
