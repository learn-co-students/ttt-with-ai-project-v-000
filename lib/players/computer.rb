module Players
class Computer < Player
  def move(board)
    valid_move = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    valid_move.shuffle!
    valid_move.detect {|move| board.valid_move?(move)}
  end

end
end
