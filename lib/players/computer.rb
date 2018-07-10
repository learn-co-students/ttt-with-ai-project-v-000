module Players
  class Computer < Player

  def move(board)
    if   board.turn_count == 0
      4
    elsif board.turn_count == 1 && board.taken?(4)
      0
    end
  end



end
end
