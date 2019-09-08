require 'pry'

module Players

  class Computer < Player

     WIN_COMBINATIONS = [
     [0, 1, 2],
     [3, 4, 5],
     [6, 7, 8],
     [0, 3, 6],
     [1, 4, 7],
     [2, 5, 8],
     [0, 4, 8],
     [2, 4, 6]
   ]

   def move(board)
     move = nil #set a nil value for later test

    if !board.taken?(5)#computer chooses middle space if unchosen
      move = "5"
    elsif board.taken?(5) && board.turn_count == 1 #computer chooses random corner if middle space is already chosen and its the very next turn
      move = ["1", "3", "7", "9"].sample
    else
    	
    	#computer strategy - there are 8 win combonations my stategy blocks or moves into a space if 2 of the 3 spots are filled in a win combination for each win combonation
    	
      WIN_COMBINATIONS.detect do |win_combo|
      	
        if move != nil
          break#break and dont do any of this code block if move has a value
          elsif (board.position(win_combo[0] + 1) == board.position(win_combo[1] + 1)) && board.taken?(win_combo[0] + 1) && !board.taken?(win_combo[2] + 1)
              move = "#{win_combo[2] + 1}"#if there are two in a row and they are not empty then go in the next space in that win combo
              #binding.pry
          elsif (board.position(win_combo[0] + 1) == board.position(win_combo[2] + 1)) && board.taken?(win_combo[0] + 1) && !board.taken?(win_combo[1] + 1)
              move = "#{win_combo[1] + 1}"#if the two outside spots like 1 and 7 are filled then go in 4 to block or win
              #binding.pry
          elsif (board.position(win_combo[1] + 1) == board.position(win_combo[2] + 1)) && board.taken?(win_combo[1] + 1) && !board.taken?(win_combo[0] + 1)
              move = "#{win_combo[0] + 1}"#this checks for the last two in a win combo like 2 and 3 then go in 1 for the block or the win
              #binding.pry
          end
        end
         move = rand(1..9) if move == nil
          
       end
       move#skip to here after break
    end

  end 
end 