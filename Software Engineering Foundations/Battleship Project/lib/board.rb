class Board

  attr_reader :size

  def initialize(n)
    # @grid = []
    # n.times do |x1|
    #   inarr = []
    #   n.times {|x2| inarr << :N}
    #   @grid << inarr
    # end
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n * n
  end

  def [](arr)
    @grid[arr[0]][arr[1]]
  end

  def []=(arr, value)
    @grid[arr[0]][arr[1]] = value
  end

  def num_ships
    @grid.reduce(0) {|acc1, e1| acc1 += e1.count(:S)}
  end
  
  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      puts "you sunk my battleship!"
      return true
    end
    self[pos] = :X
    false
  end

  def place_random_ships
    while self.num_ships < @size / 4
      self[[randomize, randomize]] = :S
    end
  end

  def randomize
    rand(0...Math.sqrt(@size).to_i) - 1
  end

  def calc_length
    Math.sqrt(@size).to_i - 1
  end

  def hidden_ships_grid
    @grid.map {|arr| arr.map {|pos| pos == :S ? pos = :N : pos = pos}}
  end

  def self.print_grid(grid)
    grid.each {|arr| puts arr.join(" ")}
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
  
end


