
class Computer < Player

  def move(board)
    move = (1..9).detect{|i| board.valid_move(i)}

  def move
    computer_move = (1..9).detect{|i| valid_move?(i)}
    game
  end

end