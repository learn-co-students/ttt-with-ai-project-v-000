module Players
  class Computer < Player
    def move(board)
      move = nil

      if board.turn_count == 1
        if !board.taken?(5)
          move = "5"
        else
          move = "1"
        end

      elsif board.turn_count == 2
        corners = [1, 3, 7, 9]
        move = corners.find{ |i| !board.taken?(i)}.to_s

      elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
            move = "2"

      else
          random_move = 1 + Random.rand(9)
          while (board.taken?(random_move))
            random_move = 1 + Random.rand(9)
          end
            move = random_move.to_s
      end
    end
  end
end
