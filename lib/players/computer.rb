require "pry"
module Players
  
  class Computer < Player
    attr_reader :token

    def initialize(token ="X")
      @token = token
    end


    
    def move(board)
      move =nil
      

  # if the middle of the board is empty take it
      if board.taken?("5") == false 
        move="5"

      # elsif game.turn_count == 1 && board.taken?("5")
      #   move = "1"

    # #2nd move hit the corners 
    #   elsif game.turn_count == 1 && board.taken?("1") != true
    #     move = "1"
    #   elsif game.turn_count == 1 && board.taken?("3") != true
    #     move = "3" 
    #   elsif game.turn_count == 1 && board.taken?("7") != true
    #     move = "7"
    #   elsif game.turn_count == 1 && board.taken?("9") != true
    #     move = "9"

    #   #don't fall for the corner trick
    #   elsif game.turn_count == 2
    #     board.taken?("1") && board.taken?("9")
    #     move = "2"  
    #   elsif game.turn_count == 2
    #     board.taken?("3") && board.taken?("7")
    #     move = "8"  

    #     #look for a win combo
    #   binding.pry  

      end
    end
  end
end


 # WIN_COMBINATIONS = 
 #    [
 #      [0,1,2],
 #      [3,4,5],
 #      [6,7,8],
 #      [0,3,6],
 #      [1,4,7],
 #      [2,5,8],
 #      [0,4,8],
 #      [2,4,6]
 #      ]