require "pry"

module Players
  
  class Computer < Player
    attr_reader :token

    def initialize(token ="X")
      @token = token
    end


    
    def move(board)
      
      move =nil

      if board.turn_count >= 2 
        check_winner(board)
      

    # if the middle of the board is empty take it
      elsif board.taken?("5") == false 
        move="5"


    #2nd move hit the corners 
      elsif board.taken?("1") != true
        move = "1"
      elsif board.taken?("3") != true
        move = "3" 
      elsif board.taken?("7") != true
        move = "7"
      elsif board.taken?("9") != true
        move = "9"

        
      
      else
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      random_move = valid_moves.sample

      board.taken?(random_move) == false
        move = random_move
       
     end
   end


      def check_winner(board)

      Game::WIN_COMBINATIONS.detect do |win_combos|

    #check winner
        

        placement_1 = board.cells[win_combos[0]]
        placement_2 = board.cells[win_combos[1]]
        placement_3 = board.cells[win_combos[2]]
             
      
      if placement_1 == token && placement_2 == token && placement_3 == " " 

        move_int = win_combos[2]+1
        move = move_int.to_s
       
      elsif placement_1 == token && placement_3 == token && placement_2 == " " 
        move_int = win_combos[1]+1
        move = move_int.to_s
     
      elsif placement_3 == token && placement_3 == token && placement_1 == " " 
        move_int = win_combos[0]+1
        move = move_int.to_s
        

  #block opponent

      elsif placement_1 != token && placement_1 != " " && placement_2 != token && placement_2 != " " && placement_3 == " " 
        move_int = win_combos[2]+1
        move = move_int.to_s
      
      elsif placement_1 != token && placement_1 != " " && placement_3 != token && placement_3 != " " && placement_2 == " " 
        move_int = win_combos[2]+1
        move = move_int.to_s
         
      elsif placement_2 != token && placement_2 != " " && placement_3 != token && placement_3 != " " && placement_1 == " " 
        move_int = win_combos[2]+1
        move = move_int.to_s 
        
      else
        move(board) 
        end
      end

    end
    
      
        
          
  end
end