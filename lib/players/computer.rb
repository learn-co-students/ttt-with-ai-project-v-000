module Players

  class Computer < Player

    def move(board)
      move = nil

      if board.turn_count == 0
        move = "5"

      elsif board.turn_count == 1 && !board.taken?(5)
        move = "5"

      elsif board.turn_count == 1 && board.taken?(5)
        # binding.pry
        move = [1, 3, 7, 9].detect {|i| !board.taken?(i)}.to_s

      elsif board.turn_count >= 2
        # binding.pry
        move = [*1..9].detect {|i| !board.taken?(i)}.to_s
        # move = board.cells.detect
      end
      move
    end

  end
end
