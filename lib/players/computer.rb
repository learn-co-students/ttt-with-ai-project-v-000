module Players
  
  class Computer < Player 
    
   def move(board)
      if board.turn_count == 0 || 1 &&  board.valid_move?("5")
       "5"
      elsif board.turn_count == 0 || 1 &&  board.valid_move?("1")
        "1"
      elsif board.turn_count == 2 &&  board.valid_move?("3")
        "3"
      elsif board.turn_count == 2 &&  board.valid_move?("7")
        "7"
      elsif board.turn_count >= 3
        winning_moves(board)
      end
   
  
      
  def winning_moves(board)
        Game::WIN_COMBINATIONS.detect do |win_combinations|
          # win_combinations == [3,4,5]
          index_1 = win_combinations[0] # 3
          index_2 = win_combinations[1] # 4
          index_3 = win_combinations[2] # 5
          
          position_1 = board.cells[index_1] 
          position_2 = board.cells[index_2]
          position_3 = board.cells[index_3]
          
          if position_1 == position_2 && board.taken?(position_1) 
            position_3
          elsif position_1 == position_3 && board.taken?(position_1) 
            position_2
          elsif position_2 == position_3 && board.taken?(position_2) 
            position_1  
        end 
      end
   end 
  end 
end
end