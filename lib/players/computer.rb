module Players
  class Computer < Player
    
    def move(board)
      if !board.taken?(5)
        move = "5"
      elsif
        move = "3" || "1" || "7" || "9"
      else board.turn_count == 2
        move = [1, 3, 7, 9].detect {|t| !board.taken?(t)}.to_s 
      end
    end
    
  end
end