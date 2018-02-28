

module Players
  class Computer < Player
    
    def move(board)
      valid_moves = board.cells.each_index.select{|i| board.cells[i] == " "}
      valid_moves.map!{|m| (m+1).to_s}
      valid_moves.sample
    end 
    
  end
end