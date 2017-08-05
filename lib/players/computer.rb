require "pry"

module Players
  
  class Computer < Player
    attr_reader :token

    def initialize(token ="X")
      @token = token
    end


    
    def move(board)
      move =nil

      #check winner
  
      if 
        board.cells[1] == token  && board.cells[2] == token && board.taken?("3") == false
          move = "3"
          binding.pry

      elsif
        board.cells[3] == token  && board.cells[2] == token && board.taken?("1") == false
          move = "1" 
      elsif
        board.cells[3] == token  && board.cells[1] == token && board.taken?("2") == false
          move = "2" 
      
      elsif
        board.cells[4] == token  && board.cells[5] == token && board.taken?("6") == false
          move = "6"
      elsif
        board.cells[5] == token  && board.cells[6] == token && board.taken?("4") == false
          move = "4" 
      elsif
       board.cells[4] == token  && board.cells[6] == token && board.taken?("5") == false
          move = "5" 

      elsif
        board.cells[7] == token  && board.cells[8] == token && board.taken?("9") == false
          move = "9"
      elsif
        board.cells[8] == token  && board.cells[9] == token && board.taken?("7") == false
          move = "7" 
      elsif
        board.cells[7] == token  && board.cells[9] == token && board.taken?("8") == false
          move = "8"  

      elsif
        board.cells[1] == token  && board.cells[4] == token && board.taken?("7") == false
          move = "7"
      elsif
        board.cells[7] == token  && board.cells[4] == token && board.taken?("1") == false 
          move = "1" 
      elsif
        board.cells[1] == token  && board.cells[7] == token && board.taken?("4") == false
          move = "4"

      elsif
       board.cells[2] == token  && board.cells[5] == token && board.taken?("8") == false
          move = "8"
      elsif
        board.cells[5] == token  && board.cells[8] == token && board.taken?("2") == false
          move = "2" 
      elsif
        board.cells[2] == token  && board.cells[8] == token && board.taken?("5") == false
          move = "5"

      elsif
        board.cells[3] == token  && board.cells[6] == token && board.taken?("9") == false
          move = "9"
      elsif
        board.cells[6] == token  && board.cells[9] == token && board.taken?("3") == false
          move = "3" 
      elsif
        board.cells[3] == token  && board.cells[9] == token && board.taken?("6") == false
          move = "6"

      elsif
        board.cells[1] == token  && board.cells[5] == token && board.taken?("9") == false
          move = "9"
      elsif
        board.cells[5] == token  && board.cells[9] == token && board.taken?("1") == false
          move = "1" 
      elsif
        board.cells[1] == token  && board.cells[9] == token && board.taken?("5") == false
          move = "5"  

      elsif
        board.cells[3] == token  && board.cells[5] == token && board.taken?("7") == false
          move = "7"
      elsif
        board.cells[5] == token  && board.cells[7] == token && board.taken?("3") == false 
          move = "3" 
      elsif
        board.cells[3] == token  && board.cells[7] == token && board.taken?("5") == false
          move = "5"  


      #check block  
      elsif 
        board.cells[1] != token  && board.cells[2] != token && board.cells[1] != " "  && board.cells[2] != " " && board.taken?("3") == false
          move = "3"

      elsif
        board.cells[3] != token  && board.cells[2] != token && board.cells[3] != " "  && board.cells[2] != " " && board.taken?("1") == false
          move = "1" 
      elsif
        board.cells[3] != token  && board.cells[1] != token && board.cells[3] != " "  && board.cells[1] != " " && board.taken?("2") == false
          move = "2" 
      
      elsif
        board.cells[4] == token  && board.cells[5] == token && board.cells[4] != " "  && board.cells[5] != " " && board.taken?("6") == false
          move = "6"
      elsif
        board.cells[5] == token  && board.cells[6] == token && board.cells[5] != " "  && board.cells[6] != " " && board.taken?("4") == false
          move = "4" 
      elsif
       board.cells[4] == token  && board.cells[6] == token && board.cells[4] != " "  && board.cells[6] != " " && board.taken?("5") == false
          move = "5" 

      elsif
        board.cells[7] == token  && board.cells[8] == token && board.cells[7] != " "  && board.cells[8] != " " && board.taken?("9") == false
          move = "9"
      elsif
        board.cells[8] == token  && board.cells[9] == token && board.cells[8] != " "  && board.cells[9] != " " && board.taken?("7") == false
          move = "7" 
      elsif
        board.cells[7] == token  && board.cells[9] == token && board.cells[7] != " "  && board.cells[9] != " " && board.taken?("8") == false
          move = "8"  

      elsif
        board.cells[1] == token  && board.cells[4] == token && board.cells[1] != " "  && board.cells[4] != " " && board.taken?("7") == false
          move = "7"
      elsif
        board.cells[7] == token  && board.cells[4] == token && board.cells[7] != " "  && board.cells[4] != " " && board.taken?("1") == false 
          move = "1" 
      elsif
        board.cells[1] == token  && board.cells[7] == token && board.cells[1] != " "  && board.cells[7] != " " && board.taken?("4") == false
          move = "4"

      elsif
       board.cells[2] == token  && board.cells[5] == token && board.cells[2] != " "  && board.cells[5] != " " && board.taken?("8") == false
          move = "8"
      elsif
        board.cells[5] == token  && board.cells[8] == token && board.cells[5] != " "  && board.cells[8] != " " && board.taken?("2") == false
          move = "2" 
      elsif
        board.cells[2] == token  && board.cells[8] == token && board.cells[2] != " "  && board.cells[8] != " " && board.taken?("5") == false
          move = "5"

      elsif
        board.cells[3] == token  && board.cells[6] == token && board.cells[3] != " "  && board.cells[6] != " " && board.taken?("9") == false
          move = "9"
      elsif
        board.cells[6] == token  && board.cells[9] == token && board.cells[6] != " "  && board.cells[9] != " " && board.taken?("3") == false
          move = "3" 
      elsif
        board.cells[3] == token  && board.cells[9] == token && board.cells[3] != " "  && board.cells[9] != " " && board.taken?("6") == false
          move = "6"

      elsif
        board.cells[1] == token  && board.cells[5] == token && board.cells[1] != " "  && board.cells[5] != " " && board.taken?("9") == false
          move = "9"
      elsif
        board.cells[5] == token  && board.cells[9] == token && board.cells[5] != " "  && board.cells[9] != " " && board.taken?("1") == false
          move = "1" 
      elsif
        board.cells[1] == token  && board.cells[9] == token && board.cells[1] != " "  && board.cells[9] != " " && board.taken?("5") == false
          move = "5"  

      elsif
        board.cells[3] == token  && board.cells[5] == token && board.cells[3] != " "  && board.cells[5] != " " && board.taken?("7") == false
          move = "7"
      elsif
        board.cells[5] == token  && board.cells[7] == token && board.cells[5] != " "  && board.cells[7] != " " && board.taken?("3") == false 
          move = "3" 
      elsif
        board.cells[3] == token  && board.cells[7] == token && board.cells[3] != " "  && board.cells[7] != " " && board.taken?("5") == false
          move = "5"  

    # if the middle of the board is empty take it
      elsif board.taken?("5") == false 
        move="5"


    # #2nd move hit the corners 
    #   elsif board.taken?("1") != true
    #     move = "1"
    #   elsif board.taken?("3") != true
    #     move = "3" 
    #   elsif board.taken?("7") != true
    #     move = "7"
    #   elsif board.taken?("9") != true
    #     move = "9"

      
      else 
        valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        random_move = valid_moves.sample

        board.taken?(random_move) == false
          move = random_move
        




        end 
      move

      end

       

        
  end
end