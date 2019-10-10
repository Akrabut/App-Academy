require_relative "board"
require_relative "player"

class Battleship

  attr_reader :board, :player

  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = (@board.size / 2).to_i
  end

  def start_game
    @board.place_random_ships
    puts "The number of ships on the board is #{board.num_ships}"
    puts "-----------------------------------------------"
    @board.print
  end

  def lose?
    if @remaining_misses <= 0 
      puts "You lose!"
      return true
    end
    false
  end

  def win?
    if @board.num_ships == 0
      puts "You win!"
      return true
    end
    false
  end

  def game_over?
    self.win? || self.lose? ? true : false
  end

  def turn
    pos = []
    loop do 
      pos = @player.get_move
      break if !invalid_pos(pos)
      puts "Invalid coordinates, try again:"
    end
    puts "\n"
    if !@board.attack(pos) 
      puts "You missed!"
      @remaining_misses -= 1 
    else puts "You hit a s ship in #{pos}"
    end
    @board.print
    puts "You have #{@remaining_misses} misses left"
    puts "\n"
  end
    
  def invalid_pos(pos)
    p pos
    p @board.calc_length
    pos[0] < 0 || pos[1] < 0 || pos[0] > @board.calc_length || pos[1] > @board.calc_length || @board[pos] == :X ? true : false
  end

end


