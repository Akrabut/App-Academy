class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14)
    @cups.map!.with_index do |_, i|
      [6, 13].include?(i) ? [] : Array.new(4, :stone)
    end
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    return true if start_pos.between?(1, 5) || start_pos.between?(7, 12)

    raise 'Invalid starting cup' unless @cups[start_pos - 1]
    raise 'Starting cup is empty' if @cups[start_pos - 1].empty?
  end

  def make_move(start_pos, current_player_side)
    stones = @cups[start_pos].length
    @cups[start_pos] = []
    last = 0
    i = 0
    cup = (start_pos + 1 + i) % 14
    stones.times do
      current_player_side == 1 ? (i += 1 if cup == 13) : (i += 1 if cup == 6)
      cup = (start_pos + 1 + i) % 14
      p "cup = #{cup} startpos = #{start_pos} curr = #{current_player_side}"
      last = @cups[cup].length
      @cups[cup] << :stone
      i += 1
    end
    next_turn = next_turn(last)
    render
    decide_return(last, cup, current_player_side)
  end

  def decide_return(last, cup, current_player_side)
    return :prompt if cup == 6 && current_player_side == 1 || cup == 13 && current_player_side == 2
    return :switch if last.zero?

    cup
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
  end

  def winner
    return :draw if @cups[6].length == 6 && @cups[13].length == 6
    return @name1 if @cups[6].length == 6
    return @name2 if @cups[13].length == 6
  end
end
