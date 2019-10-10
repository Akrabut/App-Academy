class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = ("_" * @secret_word.length).split("")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(c)
    @attempted_chars.include?(c)
  end

  def get_matching_indices(c)
    indices = []
    @secret_word.each_char.with_index {|char, i| indices << i if char == c}
    indices
  end

  def fill_indices(c, arr)
    arr.each {|i| @guess_word[i] = c}
  end

  def try_guess(c)
    if already_attempted?(c)
      puts "that has already been attempted"
      return false
    end
    @attempted_chars << c
    @remaining_incorrect_guesses -= 1 if !@secret_word.include?(c)
    arr = get_matching_indices(c)
    fill_indices(c, arr)
    return true
  end
  
  def ask_user_for_guess
    print "Enter a char:"
    chosen = gets.chomp
    try_guess(chosen)
  end

  def win?
    if @guess_word == @secret_word.split("")
      puts "WIN" 
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    end
    false
  end

  def game_over?
    if lose? || win?
      puts @secret_word
      return true
    end
    false
  end

end


