module Players
  class Computer < Player

    def move(board)
      move = nil

      if !board.taken?(5)
        move = "5"

      elsif board.turn_count == 1
        move = "1"

      elsif board.turn_count == 2
        move = [1,3,7,9].detect{|i| !board.taken?(i)}.to_s
      else
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s
      end
    end
  end
end
