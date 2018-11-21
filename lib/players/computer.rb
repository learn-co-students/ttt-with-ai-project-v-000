module Players 
  class Computer < Player 
    
    def move(board)
      valid_moves = Array.new
      board.cells.each_with_index do |position, index|
        if position == " "
          valid_moves << (index+1).to_s
        end
      end
      valid_moves.sample
    end  
  end 
end