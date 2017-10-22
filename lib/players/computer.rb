module Players
  class Computer < Player
    def move(board)
      center = 5
      corners = [1,3,7,9]
      move = nil

      if !board.taken?(center)
        move = center
      elsif board.turn_count == 1
        move = 1
      else
        move = corners.find{|c| !board.taken?(c)}
      end
      if move
        move.to_s
      else
        rand(1..9).to_s
      end
    end
  end
end
