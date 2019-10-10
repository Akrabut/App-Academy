# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple 
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    num_1 > num_2 ? max = num_1 : max = num_2
    (max..num_1 * num_2).each {|n| return n if n % num_1 == 0 && n % num_2 == 0}
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    hash = Hash.new(0)
    str.each_char.with_index {|c, i| hash[c + str[i+1]] += 1 if str[i + 1]}
    hash.key(hash.values.max)
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        self.map {|k, v| k, v = v, k}.to_h
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        sum = 0
        self.each.with_index do |n1, i1| 
            self.each.with_index do |n2, i2|
                next if i2 <= i1
                 sum+=1 if n1 + n2 == num 
            end
        end
        sum
    end


    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    def bubble_sort(&prc)
        prc ||= Proc.new do |a, b| 
            if self[b] && (self[b] < self[a]) 
                self[a], self[b] = self[b], self[a] 
                true
            else false
            end
        end
        loop do 
            swapped = false    
            self.each.with_index do |x, i|
                swapped = true if prc.call(i, i+1)
            end
            break if !swapped
        end
    end
end

