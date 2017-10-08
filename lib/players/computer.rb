module Players

  class Computer<Player

    def move(board) #returns a valid position for the computer to move

      # first move go to center
      if !board.taken?(5)
        move = "5"

      # if 5 is taken? go to 1, 3, 7, or 9
        elsif board.turn_count == 1
          move = ["1", "3", "7", "9"]

      # block diagonal:
        elsif board.turn_count == 2 && board.position(1) == board.position(9) || board.position(3) == board.position(7)
          move = "2"

          # hedging all bets
        elsif board.turn_count == 3 && board.position(2) == board.position(8) || board.position(4) == board.position(6)
          move = ["1", "3", "7", "9"]
        end
        move
      end


  end
end
