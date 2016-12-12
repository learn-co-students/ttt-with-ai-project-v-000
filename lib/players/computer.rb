class Player::Computer < Player
    
    def move(board)
      
      def opponent_token
        self.token == "X" ? "O" : "X"
      end 
      
      case board.turn_count
        when 0 #X
          return '5'
        when 1 #O
          if board.valid_move?('5')
            return '5'
          else
            return "#{[1,3,7,9].sample}"
          end
        when 2 #X
          if board.cells[0] == opponent_token then return '9'
          elsif board.cells[2] == opponent_token then return '7'
          elsif board.cells[6] == opponent_token then return '3'
          else
              return '1'
          end
        when 3 #O
          if board.cells[8] == @token || board.cells[0] == @token then return "#{[3,7].sample}"
          else
            return "#{[1,9].sample}"
          end
        when 4 #X
          if board.cells[0] == opponent_token && board.cells[2] == opponent_token then return "2"
          elsif board.cells[2] == opponent_token && board.cells[8] == opponent_token then return "6"
          elsif board.cells[8] == opponent_token && board.cells[6] == opponent_token then return "8"
          else
              return "4"
          end
        when 5 #O
          if board.cells[1] == opponent_token && board.cells[4] == opponent_token then return "8"
          elsif board.cells[3] == opponent_token && board.cells[4] == opponent_token then return "6"
          elsif board.cells[4] == opponent_token && board.cells[5] == opponent_token then return "4"
          else
            return "2"
          end
        when 6, 7, 8  #X, #O, #X
          Game::WIN_COMBINATIONS.each do |array|
            array.each do |item| 
              if !board.taken?(item) && item != @token then return "#{item}"
              end
            end
          end
        end
    end
end
        
      
          
        
        
  
    
