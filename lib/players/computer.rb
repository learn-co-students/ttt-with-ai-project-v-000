module Players
  class Computer < Player
    
    def move(board)
      brain = ComputerBrain.new
      brain.move(board)
    end
  end
  
end