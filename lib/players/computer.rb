
class Computer < Player

  def move
    computer_move = (1..9).detect{|i| valid_move?(i)}
  end

end