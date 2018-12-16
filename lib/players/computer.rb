module Players

  class Computer < Player
    
    def move(board)
      available_moves = []
      board.cells.each_index do |index|
        if board.cells[index] === " "
          available_moves.push(index)
        end
      end
      @user_input = available_moves[rand(available_moves.length - 1)]
      @user_input.to_s
    end
    
  end
  
end