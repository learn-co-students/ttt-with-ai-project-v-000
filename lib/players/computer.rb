require 'pry'

class Computer < Player
  def move(board)
    sleep 0.3
    valid_moves = ["5", "1", "9", "3", "4", "6", "7", "2", "8"]
    valid_moves.shuffle!
    valid_moves.detect { |move| board.valid_move?(move) }
  end
end
