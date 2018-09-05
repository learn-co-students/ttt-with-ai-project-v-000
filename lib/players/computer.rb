module Players
  class Computer < Player

    def move(board)
      (0..8).each do |i|
        if board.valid_move?(i)
          return i.to_s
        end
      end
    end
    
    
  end
end