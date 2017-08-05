require "pry"

module Players
  
  class Computer < Player
    attr_reader :token

    def initialize(token ="X")
      @token = token
    end


    
    def move(board)
      move =nil

      binding.pry
       
      #check winner
  
      if 
        board.taken?("1") == true  && board.taken?("2") == true  && board.taken?("3") == false
          move = "3"
          
      elsif
        board.taken?("3") == true  && board.taken?("2") == true  && board.taken?("1") == false
          move = "1" 
      elsif
        board.taken?("3") == true  && board.taken?("1") == true  && board.taken?("2") == false
          move = "2" 
      

      elsif
        board.taken?("4") == true  && board.taken?("5") == true  && board.taken?("6") == false
          move = "6"
      elsif
        board.taken?("5") == true  && board.taken?("6") == true  && board.taken?("4") == false
          move = "4" 
      elsif
       board.taken?("4") == true  && board.taken?("6") == true  && board.taken?("5") == false
          move = "5" 


      elsif
        board.taken?("7") == true  && board.taken?("8") == true  && board.taken?("9") == false
          move = "9"
      elsif
        board.taken?("8") == true  && board.taken?("9") == true  && board.taken?("7") == false
          move = "7" 
      elsif
        board.taken?("7") == true  && board.taken?("9") == true  && board.taken?("8") == false
          move = "8"  


      elsif
        board.taken?("1") == true  && board.taken?("4") == true  && board.taken?("7") == false
          move = "7"
      elsif
        board.taken?("7") == true  && board.taken?("4") == true  && board.taken?("1") == false
          move = "1" 
      elsif
        board.taken?("1") == true  && board.taken?("7") == true  && board.taken?("4") == false
          move = "4"

      elsif
       board.taken?("2") == true  && board.taken?("5") == true  && board.taken?("8") == false
          move = "8"
      elsif
        board.taken?("5") == true  && board.taken?("8") == true  && board.taken?("2") == false
          move = "2" 
      elsif
        board.taken?("2") == true  && board.taken?("8") == true  && board.taken?("5") == false
          move = "5"

      elsif
        board.taken?("3") == true  && board.taken?("6") == true  && board.taken?("9") == false
          move = "9"
      elsif
        board.taken?("6") == true  && board.taken?("9") == true  && board.taken?("3") == false
          move = "3" 
      elsif
        board.taken?("3") == true  && board.taken?("9") == true  && board.taken?("6") == false
          move = "6"

      elsif
        board.taken?("1") == true  && board.taken?("5") == true  && board.taken?("9") == false
          move = "9"
      elsif
        board.taken?("5") == true  && board.taken?("9") == true  && board.taken?("1") == false
          move = "1" 
      elsif
        board.taken?("1") == true  && board.taken?("9") == true  && board.taken?("5") == false
          move = "5"  

      elsif
        board.taken?("3") == true  && board.taken?("5") == true  && board.taken?("7") == false
          move = "7"
      elsif
        board.taken?("5") == true  && board.taken?("7") == true  && board.taken?("3") == false 
          move = "3" 
      elsif
        board.taken?("3") == true  && board.taken?("7") == true  && board.taken?("5") == false
          move = "5"  


       
      

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

       

        
  end
end