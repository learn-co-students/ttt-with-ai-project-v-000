module Players
  class Computer < Player
  
    def move(board)
      valid = []
      board.cells.each_with_index { |e, i| valid << (i + 1).to_s if board.taken?(i + 1) == false }
      valid.sample
    end
  end 
end 