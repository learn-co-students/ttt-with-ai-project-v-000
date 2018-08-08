module Players
  class Computer < Player
     
    WIN_COMBINATIONS = [ [0, 1, 2], [3, 4, 5], [6, 7, 8],
                       [0, 3, 6], [1, 4, 7], [2, 5, 8],
                       [0, 4, 8], [2, 4, 6] ]
  
    def move(board)
      valid = []
      good_move = []
      best_move = []
      @token == "X" ? o_token = "O" : o_token = "X"
      
      board.cells.each_with_index { |e, i| valid << (i + 1).to_s if board.taken?(i + 1) == false }
      
      good_line_3rd = WIN_COMBINATIONS.detect {|line| board.cells[line[0]] == board.cells[line[1]] && board.cells[line[1]] == @token && board.taken?(line[2] + 1) == false}
  
      if good_line_3rd != nil 
        good_move << (good_line_3rd[2] + 1).to_s
         
      end 
        
      good_line_2nd = WIN_COMBINATIONS.detect {|line| board.cells[line[0]] == board.cells[line[2]] && board.cells[line[2]] == @token && board.taken?(line[1] + 1) == false}
  
      if good_line_2nd != nil 
         good_move << (good_line_2nd[1] + 1).to_s
      end 
      
       good_line_1st = WIN_COMBINATIONS.detect {|line| board.cells[line[1]] == board.cells[line[2]] && board.cells[line[2]] == @token && board.taken?(line[0] + 1) == false}
  
      if good_line_1st != nil 
         good_move << (good_line_1st[0] + 1).to_s
      end 
      
      best_line_3rd = WIN_COMBINATIONS.detect {|line| board.cells[line[0]] == board.cells[line[1]] && board.cells[line[1]] == o_token && board.taken?(line[2] + 1) == false}
  
      if best_line_3rd != nil 
         best_move << (best_line_3rd[2] + 1).to_s
      end 
        
      best_line_2nd = WIN_COMBINATIONS.detect {|line| board.cells[line[0]] == board.cells[line[2]] && board.cells[line[2]] == o_token && board.taken?(line[1] + 1) == false}
  
      if best_line_2nd != nil 
         best_move << (best_line_2nd[1] + 1).to_s
      end 
      
       best_line_1st = WIN_COMBINATIONS.detect {|line| board.cells[line[1]] == board.cells[line[2]] && board.cells[line[2]] == o_token && board.taken?(line[0] + 1) == false}
  
      if best_line_1st != nil 
         best_move << (best_line_1st[0] + 1).to_s
      end 
      
      if best_move.length != 0 
        best_move.sample 
      elsif good_move.length != 0 
        good_move.sample 
      else 
        valid.sample 
      end
    end
  end 
end 