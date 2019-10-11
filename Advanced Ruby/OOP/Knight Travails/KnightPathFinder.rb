require_relative '../polytree/lib/00_tree_node'

class KnightPathFinder
  def self.within_boundaries(pos)
    pos[0].between?(0, 7) && pos[1].between?(0, 7)
  end

  def self.valid_moves(pos)
    valid_moves = []
    valid_moves << [pos[0], pos[1] - 1] if KnightPathFinder.within_boundaries([pos[0], pos[1] - 1])
    valid_moves << [pos[0], pos[1] + 1] if KnightPathFinder.within_boundaries([pos[0], pos[1] + 1])
    valid_moves << [pos[0] - 1, pos[1]] if KnightPathFinder.within_boundaries([pos[0] - 1, pos[1]])
    valid_moves << [pos[0] + 1, pos[1]] if KnightPathFinder.within_boundaries([pos[0] + 1, pos[1]])
    valid_moves << [pos[0] - 1, pos[1] - 1] if KnightPathFinder.within_boundaries([pos[0] - 1, pos[1] - 1])
    valid_moves << [pos[0] - 1, pos[1] + 1] if KnightPathFinder.within_boundaries([pos[0] - 1, pos[1] + 1])
    valid_moves << [pos[0] + 1, pos[1] - 1] if KnightPathFinder.within_boundaries([pos[0] + 1, pos[1] - 1])
    valid_moves << [pos[0] + 1, pos[1] + 1] if KnightPathFinder.within_boundaries([pos[0] + 1, pos[1] + 1])
  end

  def initialize
    @board = Array.new(8) { Array.new(8) }
    @root_node = PolyTreeNode.new([0, 0])
    @considered_positions = []
    @considered_positions << [0, 0]
    setup_board
  end

  def new_move_positions(pos)
    valid_moves = KnightPathFinder.valid_moves(pos)
    new_positions = valid_moves.reduce([]) {|new_pos_arr, new_pos| @considered_positions.include?(new_pos) ? new_pos_arr : new_pos_arr << new_pos }
    @considered_positions.concat(new_positions) if new_positions
    new_positions
  end

  def setup_board
    @board.map!.with_index do |inner_array, i|
      inner_array.map!.with_index { |_, j| PolyTreeNode.new([i, j]) }
    end
  end

  def setup_children
    @board.each do |inner_array|
      inner_array.each do |node|
        new_move_positions()
  end

  def build_move_tree(pos)
    move_tree = [@root_node.value]
    until move_tree.empty?
      node = move_tree.shift
      return node if node == pos

      move_tree.concat(new_move_positions(node))
    end
  end

  def find_path(end_pos)

  end
end

k = KnightPathFinder.new
k.setup_children