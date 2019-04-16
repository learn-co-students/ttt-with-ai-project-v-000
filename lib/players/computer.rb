module Players 
  class Computer < Player
    
    def move(board)
      move = nil 
      (1..9).to_a.sample.to_s
    end
  end
end