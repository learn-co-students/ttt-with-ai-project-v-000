
require 'pry'
module Players
  class Computer < Player
    WIN_COMBINATIONS = [
       [0,1,2],
       [3,4,5],
       [6,7,8],
       [0,3,6],
       [1,4,7],
       [2,5,8],
       [0,4,8],
       [2,4,6]
     ]

     def move(board)
       #colloquial algorithm, starts by suggesting computer moves to middle, then corners
       #use the board.taken? method
       computer_move = nil

       if !board.taken?(5)
         computer_move = "5"
       elsif !board.taken?(1)
         computer_move = "1"
       elsif !board.taken?(3)
         computer_move = "3"
       elsif !board.taken?(7)
         computer_move = "7"
       elsif !board.taken?(9)
         computer_move = "9"
       elsif !board.taken?(2)
         computer_move = "2"
       elsif !board.taken(4)
         computer_move = "4"
       elsif !board.taken(6)
         computer_move = "6"
       elsif !board.taken(8)
         computer_move = "8"
       end
     end
   end
 end
