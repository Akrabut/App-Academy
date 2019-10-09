def add(num1, num2)
  num1+num2
end

def subtract(num1, num2)
  num1-num2
end

def sum(arr)
  arr.sum
end

def multiply(*args)
  product = 1
  args.each {|x| product *= x}
  product
end

def power(num1, num2)
  (num2 - 1).times {num1*=num1}
  num1
end

def factorial(num)
  (num == 0 || num == 1) ? (return 1) : nil
  fact = 1
  (2..num).each {|i| fact *= i}
  fact
end
