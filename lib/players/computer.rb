class Computer < Player

  def move(board)
    valid = false
    until valid != false
      position = (1..9).to_a.sample
      valid = board.valid_move?(position)
    end
    position.to_s
  end

end