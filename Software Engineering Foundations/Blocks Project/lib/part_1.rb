def select_even_nums(arr)
  arr.select(&:even?)
end

def reject_puppies(arr)
  arr.reject{|h| h["age"] <= 2}
end

def count_positive_subarrays(arr)
  arr.select{|a| a.sum > 0}.count
end

def aba_translate(str)
  newstr = ""
  str.each_char do |c|
    newstr += c
    if "aeiou".include?(c)
      newstr += "b"
      newstr += c
    end
  end
  newstr
end

def aba_array(arr)
  arr.map{|w| aba_translate(w)}
end


