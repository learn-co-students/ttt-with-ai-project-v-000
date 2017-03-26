module Players
  class Computer < Player

  @@moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

  def move(board)
    move = nil

    if board.turn_count == 0 && !board.taken?(5)
      move = "5"
    elsif board.turn_count == 1 && !board.taken?(5)
      move = "5"
    else
      @@moves.detect {|move| board.taken?(move) == false}
    end

  end






  end
end
