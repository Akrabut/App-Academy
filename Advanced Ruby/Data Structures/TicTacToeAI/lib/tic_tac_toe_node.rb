require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    @board.over? && @board.winner == :x
  end

  def winning_node?(evaluator)
    @board.over? && !@board.winner == :x
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    moves = []
    @board.each.with_index do |row, i|
      row.each.with_index do |e, j|
        moves << TicTacToeNode.new(@board, [i, j], [i, j]) if e.empty?
      end
    end
  end
end
