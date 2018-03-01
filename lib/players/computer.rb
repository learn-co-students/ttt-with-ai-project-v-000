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
      [6,4,2]
    ]
    
    def move(board)
      sleep(1)
      WIN_COMBINATIONS.select do |win_combo|
        played_tokens = win_combo.count{|space| board.cells[space] == "X"}
        if played_tokens == 2
         #need to find out which space in array is empty.
          i_array = win_combo.grep(" ")
          i = i_array[0]
        end
        
        if board.valid_move?(i)
          i.to_s
        end
      end
    end
  end
end  




#we want our computer player to be able to play with some strategy.


#Every turn, the computer could iterate through WIN_COMBINATIONS to see if any combination has 2 of the same symbol. If it does, the computer should move into the third space.

#What if no combinations have 2, like the first few turns of the game? Then we'd want the computer player to play through any win combination, like try to do 0,1,2 or 2,4,6, until someone is one move from winning.

#No matter what, the method needs to return a string number between 1 and 9.