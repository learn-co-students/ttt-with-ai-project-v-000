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
    end
  
      
  def winning_moves(board)
        position = ""
        Game::WIN_COMBINATIONS.each do |win_combinations|
          # win_combinations == [3,4,5]
          index_1 = win_combinations[0] # 3
          index_2 = win_combinations[1] # 4
          index_3 = win_combinations[2] # 5
          
          position_1 = board.cells[index_1] 
          position_2 = board.cells[index_2]
          position_3 = board.cells[index_3]
          #binding.pry
          if position_1 == position_2 && board.taken?(index_1) 
            position = index_3
          elsif position_1 == position_3 && board.taken?(index_1) 
            position = index_2
          elsif position_2 == position_3 && board.taken?(index_2) 
            position = index_1  
          end
      end
      position
    end 
  end
end
