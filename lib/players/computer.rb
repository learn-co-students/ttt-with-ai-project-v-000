module Players
  class Computer < Player

  def move(board)
    if board.valid_move?("1")
      "1"
    elsif board.valid_move?("5")
      "5"
    end
  end

  end
end
