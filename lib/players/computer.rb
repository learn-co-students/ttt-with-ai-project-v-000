
module Players
  class Computer < Player
    
    def move(board)
      moves = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
      if board.turn_count < 3
        "6" if board.position("6") != ' ' # center
    
    
      end
      # conditionals for 2 in a row, etc
    
    end

    
  end
end