class Player

  def get_move
    puts 'enter a position with coordinates separated with a space like `0 1`'
    gets.chomp.split(" ").map {|e| e.to_i}
  end

end


