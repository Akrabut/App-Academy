def sum_to(n)
  return 1 if n == 1
  sum_to(n-1) + n
end

def add_numbers(arr)
  return arr[0] if !arr[1]
  add_numbers(arr[1..-1]) + arr[0]
end

def gamma_func(n)
  factorial(n-1)
end

def factorial(n)
  return 1 if n == 1
  return nil if n == 0
  factorial(n-1) * n
end

def ice_cream_shop(flavors, favorite)
  return false if !flavors[0]
  return true if flavors[0] == favorite
  ice_cream_shop(flavors[1..-1], favorite) 
end

def reverse(str)
  return str[-1] if !str[-2]
  str[-1] + reverse(str[0..-2])
end


