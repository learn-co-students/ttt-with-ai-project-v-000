module Players
  
  class Computer < Player
    
    def move(board)
      sleep(3)
      
      if board.cells.all? { |cell| cell == " " }
        '5'
      else
        random
      end
    end
    
    def random
      (0..8).to_a.sample
    end
    
  end
  
end