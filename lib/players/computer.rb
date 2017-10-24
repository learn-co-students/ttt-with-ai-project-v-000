module Players

  class Computer < Player


    def move(board)

      if board.turn_count == 0 && !board.taken?("5")
        "5"
     else
         ([*1..9] - [5]).sample
      end
    end
  end



end
