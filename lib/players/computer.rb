module Players
  class Computer < Player
    
    def move(board)
      move = " " 
      if !board.taken?(5)
        move = "5"
      else
        move = "5" += 1
      end
    end
    
  end
end