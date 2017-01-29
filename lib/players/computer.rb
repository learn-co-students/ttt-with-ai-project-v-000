module Players
  class Computer < Player
    def move(board)
      move = nil

      if board.taken?(5) == false
        move = "5"

      elsif board.turn_count == 1
        move = "1"

      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect {|position| !board.taken?(position)}.to_s

      elsif board.turn_count == 3
        if board.position(1) == board.position(3)
          move = "2"
        elsif board.position(1) == board.position(7)
          move = "4"
        elsif board.position(1) == board.position(9)
          move = "5"
        elsif board.position(3) == board.position(7)
          move = "5"
        else
         move = [5, 7, 9, 3, 6, 8, 4, 2, 1].detect {|position| !board.taken?(position)}.to_s
         return move
        end

      elsif board.turn_count > 3
        if !board.full?
          move = [5, 7, 9, 3, 6, 8, 4, 2, 1].detect {|position| !board.taken?(position)}.to_s
        end
      end
      move
    end
  end
end
