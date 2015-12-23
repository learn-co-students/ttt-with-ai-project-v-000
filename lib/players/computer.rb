
class Computer < Player

  def move(board)
    move = (1..9).detect{|i| board.valid_move(i)}
  end

end