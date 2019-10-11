LIST1 = [0, 3, 5, 4, -5, 10, 1, 90]
LIST2 = [1, 2, 3]

def my_min1
  LIST1.reduce do |num1|
    LIST1.reduce { |min, num2| num2 < num1 ? num2 : min }
  end
end

def my_min2
  LIST1.reduce { |smallest, num| num < smallest ? num : smallest }
end

def subsum1
  arr = []
  LIST2.each_index do |i|
    LIST2.each_index do |j|
      arr << LIST2[i..j] unless i > j
    end
  end
  arr.reduce(arr[0].sum) { |max, subarr| subarr.sum > max ? subarr.sum : max }
end

def subsum2

end

p subsum1
