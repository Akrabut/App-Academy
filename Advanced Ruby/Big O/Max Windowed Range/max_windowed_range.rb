# O(n^2)
def windowed_max_range(array, window_size)
  current_max_range = nil
  array.each_index do |i1|
    array.each_index do |i2|
      if i1 < i2 && array[i1..i2].length == window_size
        possible_max = array[i1..i2].max - array[i1..i2].min
        current_max_range ||= possible_max
        current_max_range = possible_max if current_max_range < possible_max
      end
    end
  end
  current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
