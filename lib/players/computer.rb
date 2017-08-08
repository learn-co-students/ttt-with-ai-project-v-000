module Players

  class Computer < Player
    def move(board)
      move = nil
      
      if board.turn_count == 0
        move = "5"
      elsif board.turn_count == 1
        if board.valid_move?("5")
          move = "5"
        else
          move = "1"
        end
      elsif board.turn_count == 2
        move = ["1", "3", "7", "9"].detect {|position| !board.taken?(position)}
      else
        move = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].detect {|position| !board.taken?(position)}
      end
      move
    end
  end

end
