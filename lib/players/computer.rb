require 'pry'

class Computer < Player
  def move(board)
    sleep 0.3
    valid_moves = ["5","1","9","6","8","3","2","4","7"]
    valid_moves.shuffle!
    valid_moves.detect{|move| board.valid_move?(move)}
  end
end