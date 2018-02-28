module Players
  class Computer < Player
    
    def move(board)
      sleep(1)
      i = rand(10)
      if board.valid_move?(i)
        i.to_s
      end
    end
  end
end  