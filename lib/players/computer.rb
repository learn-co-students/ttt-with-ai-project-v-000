module Players
  class Computer < Player

    def move(board)
      move = nil

      if !board.taken?(3)
        move = "3"

      elsif board.turn_count == 1
        move = "1"

      elsif board.turn_count == 2
        move = [5, 7, 9].detect{|i| !board.taken(i)}.to_s

      else move = [1, 2, 3, 4, 5, 6, 7, 8, 9].detect {|i| !board.taken(i)}.to_s

      end

    end

end

end
