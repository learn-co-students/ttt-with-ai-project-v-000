module Players
  
  class Computer < Player
    
    def move(board)
      if board.turn_count == 0 || board.turn_count == 1
        if board.valid_move?("5")
          "5"
        elsif board.valid_move?("1")
          "1"
        end
      elsif game.WIN_COMBINATIONS.find do |combo|
        board.cells[combo[0]] == board.cells[combo[1]] || board.cells[combo[1]] == board.cells[combo[2]] || board.cells[combo[0]] == board.cells[combo[2]]
          if board.valid_move?(!taken?(combo))
            !taken?(combo)
          end
        end
      end
    end
     
    
  end
  
end