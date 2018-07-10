
module Players
  class Computer < Player

  def move(board)
    if   board.turn_count == 0
      "5"
    elsif board.turn_count == 1
      if board.taken?(5)
        "1"
      else
        "5"
      end
    else
      "#{rand(1...9)}"
    end
  end
end
end
