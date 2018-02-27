module Players
  class Computer < Player
    def move(board) #will come back to add necessary computer logic 
      rand(1..9).to_s
    end
  end
end
