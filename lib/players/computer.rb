module Players
  class Computer < Player
    
    
    WIN_COMBOS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
  
    
    def move(board)
      #find_first_valid_move(board)
      avoid_loss_move(board)
    end
    
  private
    
    def find_first_valid_move(board)
      all_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      all_moves.find { |m| board.valid_move?(m) }
    end
   
    #if any of the winning position combo's have a blank and two of my opponents
    #tokens then I will move into that blank position
    #
    def avoid_loss_move(board)
      if (near_win = WIN_COMBOS.find { |combo| near_win?(combo, board) } )
        index = blank_cell_index(near_win, board)
        return (index + 1).to_s #convert to position 
      else
        return find_first_valid_move(board)
      end
    end
    
    def near_win?(combo, board)
      cell_values = combo.collect { |index| board.cells[index] }
      opponent_count = cell_values.find_all { |e| e == self.opponent_token }.size
      blank_count = cell_values.find_all { |e| e == " " }.size
      opponent_count == 2 && blank_count == 1
    end
    
    def blank_cell_index(near_win_combo, board)
      near_win_combo.find { |index| board.cells[index] == " "} 
    end
    
  end
end