module Players
  class Computer < Player
    
    def move(board)
      ["1","2","3","4","5","6","7","8","9"].shuffle.first
    end
  end
  
end