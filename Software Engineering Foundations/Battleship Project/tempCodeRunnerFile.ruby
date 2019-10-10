require_relative "battleship"

def play
  b = Battleship.new(10)
  b.start_game
end

play