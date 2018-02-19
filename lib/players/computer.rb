module Players
  class Computer < Player

    def move(board)
      if !board.taken?(5)
        move = "5"
      elsif board.turn_count == 1
        move = "1"
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s
      else
        int = rand(1..9)
        if !board.taken?(int)
          move = int
        end
      end
    end
  end
end
