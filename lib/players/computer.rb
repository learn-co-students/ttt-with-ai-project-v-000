module Players
  class Computer < Player 
    
    def move(board)
      move = nil 
      
        # If going first, take the middle square. If going second and middle is open, take it. 
      if !board.taken?(5)
        move = "5"
        
        # If going second (and you took the middle square), and the opponent took a corner square, take a side square. 
      elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
        move = [2, 4, 6, 8].detect{|i| i.board.position(i+1)}.to_s 
        
      # elsif board.turn_count == 4 && (board.position(2) == board.position(8) || board.position(4) == board.position(6))
      #   move = [1, 3, 7, 9].detect{|i| i.board.position(i+1)}.to_s 
      
      else 
        Game::WIN_COMBINATIONS.detect do |win_combo|
          
          if win_combo.select{|i| board.position(i+1) == token}.size == 2 && win_combo.any?{|i| board.position(i+1) == " "}
            move = win_combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
            
          elsif win_combo.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && win_combo.any?{|i| board.position(i+1) == " "}
              move = win_combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
      end 
      move 
    end
  end 
end 