require 'byebug'

# EASY

# Define a method that returns the sum of all the elements in its argument (an
# array of numbers).
def array_sum(arr)
  return 0 if arr == []
  arr.reduce(:+)
end

# Define a method that returns a boolean indicating whether substring is a
# substring of each string in the long_strings array.
# Hint: you may want a sub_tring? helper method
def in_all_strings?(long_strings, substring)
  long_strings.each {|w| w.include?(substring) ? next : (return false)}
  true
end


# Define a method that accepts a string of lower case words (no punctuation) and
# returns an array of letters that occur more than once, sorted alphabetically.
def non_unique_letters(string)
  carr = []
  string.split(" ").join.each_char {|c| carr.push(c) if string.count(c) > 1}
  carr = carr.uniq!.sort
end


# Define a method that returns an array of the longest two words (in order) in
# the method's argument. Ignore punctuation!
def longest_two_words(string)
  string.split(" ").sort_by{|w| w.length}.reverse[0..1]
end

# MEDIUM

# Define a method that takes a string of lower-case letters and returns an array
# of all the letters that do not occur in the method's argument.
def missing_letters(string)
  letters = ("a".."z").to_a
  string.each_char {|c| letters.delete(c) if letters.include?(c)}
  letters
end

# Define a method that accepts two years and returns an array of the years
# within that range (inclusive) that have no repeated digits. Hint: helper
# method?
def no_repeat_years(first_yr, last_yr)
  (first_yr..last_yr).reduce([]) {|yrs, yr| not_repeat_year?(yr) ? yrs.push(yr) : yrs}
end

def not_repeat_year?(year)
  year.to_s.split("").uniq == year.to_s.split("")
end


# HARD

# Define a method that, given an array of songs at the top of the charts,
# returns the songs that only stayed on the chart for a week at a time. Each
# element corresponds to a song at the top of the charts for one particular
# week. Songs CAN reappear on the chart, but if they don't appear in consecutive
# weeks, they're "one-week wonders." Suggested strategy: find the songs that
# appear multiple times in a row and remove them. You may wish to write a helper
# method no_repeats?
def one_week_wonders(songs)
  songs = songs.split(" ")
  songs.each.with_index do |s, i|
    no_repeats?(s, songs, i) ? next : songs.delete(s)
  end
  songs.uniq
end

def no_repeats?(song_name, songs, i)
  songs.count(song_name) == 1 ? (return true) : nil
  songs[i-1] == song_name || songs[i+1] == song_name ? (return false) : (return true)
end


# Define a method that, given a string of words, returns the word that has the
# letter "c" closest to the end of it. If there's a tie, return the earlier
# word. Ignore punctuation. If there's no "c", return an empty string. You may
# wish to write the helper methods c_distance and remove_punctuation.

def for_cs_sake(string)
  string.include?("c") ? nil : (return "")
  string = string.split(" ")
  string = activate_punc(string)
  string = remove_non_cwords(string)
  min = c_distance(string[0])
  string.reduce(string[0]) do |cword, w|
    dis = c_distance(w)
    if dis < min
      min = dis
      cword = w
    else cword
    end
  end
end

def remove_non_cwords(string)
  string.each {|w| w.include?("c") ? next : string.delete(w)}
  string
end

def c_distance(word)
  i = word.length-1
  while word[i] != "c"
    i-=1
  end
  i
end

def delete_punc(word)
  letters = ("a".."z").to_a
  word.each_char {|c| word.delete!(c) if !letters.include?(c)}
end

def activate_punc(string)
  string.map!{|w| delete_punc(w)}
end


# Define a method that, given an array of numbers, returns a nested array of
# two-element arrays that each contain the start and end indices of whenever a
# number appears multiple times in a row. repeated_number_ranges([1, 1, 2]) =>
# [[0, 1]] repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]

def repeated_number_ranges(arr)
  acc = []
  tempi = nil
  i = 0
  while (i < arr.length)
    if arr[i+1] == arr[i]
      tempi = calc_range(arr, arr[i], i)
      acc.push([i, tempi])
      i = tempi
    end
    i+=1
  end
  acc
end

def calc_range(arr, var, idx)
  arr.each.with_index do |n, i|
    return i if n == var && arr[i+1] != n && i > idx
  end
end

p repeated_number_ranges([1, 2, 3, 3, 4, 4, 4, 3, 3])