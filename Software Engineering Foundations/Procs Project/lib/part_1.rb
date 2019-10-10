def my_map(arr, &blk)
  newarr = []
  arr.each {|n| newarr.push(blk.call(n))}
  p newarr
end

def my_select(arr, &blk)
  newarr = []
  arr.each {|n| newarr.push(n) if blk.call(n)}
  newarr
end

def my_count(arr, &blk)
  num = 0
  arr.each {|x| num +=1 if blk.call(x)}
  num
end

def my_any?(arr, &blk)
  arr.each {|x| return true if blk.call(x)}
  false
end

def my_all?(arr, &blk)
  arr.each {|x| return false if !blk.call(x)}
  true
end

def my_none?(arr, &blk)
  arr.each {|x| return false if blk.call(x)}
  true
end
