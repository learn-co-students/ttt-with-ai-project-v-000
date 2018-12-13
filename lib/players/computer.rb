module Players

  class Computer < Player
    
    def move(board)
      available_moves = []
      board.cells.each do |cell|
        if cell === " "
          available_moves.push(cell)
        end
      end
      @user_input = 1 + rand(available_moves.length - 1)
      @user_input.to_s
    end
    
  end
  
end