module Players

  class Computer < Player

    def move(board)
      center = 5
      diamond = [2, 4, 6, 8]
      move = nil


      if !board.taken?(center)
        move = center
      elsif board.turn_count == 1
        move = 1
      else
        move = diamond.find{|d| !board.taken?(d)}
      end
      if move
        move.to_s
      else
        rand(1..9).to_s
      end
    end
  end

end
 
