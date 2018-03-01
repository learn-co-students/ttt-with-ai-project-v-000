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
    
    def initial_move(board)
      first_moves ||= WIN_COMBINATIONS.sample #pick a random win_combo to play through
      i = first_moves.sample
      if board.cells[i] == " "
        move = i + 1
        move.to_s
      else
        initial_move(board)
      end
    end
    
    #equality principle - iterate through win combo, if win combo[0] == win combo[1]
    
    #def move(board)
    #  sleep(1)
    #  i = rand(10)
    #  i.to_s
    #end
    
    def move(board)
      sleep(1)
      if board.turn_count < 3 #first three moves, the computer plays randomly
        initial_move(board)
      else
        position_priority(board)
      #else #if not one space from winning, play a random space
      #  i = rand(10)
      #  i.to_s
       end
    end
    
    def position_priority(board)
      WIN_COMBINATIONS.each do |win_combo|
        position_priority = [[0, 1, 2], [0, 2, 1], [1, 2, 0]]
        position_priority.each do |priority|
          if board.cells[win_combo[priority[0]]] == "X" &&
             board.cells[win_combo[priority[1]]] == "X"
              if board.cells[win_combo[priority[2]]] == " "
                 win_combo[priority[2]]
              end
            end
          end
        end
      end
    
    #def move(board)
    #  sleep(1)
    #  close_to_winning_combo = WIN_COMBINATIONS.detect do |win_combo|
    #    played_tokens = win_combo.count{|space| board.cells[space] == "X"}
    #    played_tokens == 2
    #  end
    #  
    #  close_to_winning_combo.each do |arr_index|
    #    if board.cells[arr_index] == " "
    #      move = arr_index + 1
    #      move.to_s
    #    end
    #  end
    #end
  end
end  




#we want our computer player to be able to play with some strategy.


#Every turn, the computer could iterate through WIN_COMBINATIONS to see if any combination has 2 of the same symbol. If it does, the computer should move into the third space.

#What if no combinations have 2, like the first few turns of the game? Then we'd want the computer player to play through any win combination, like try to do 0,1,2 or 2,4,6, until someone is one move from winning.

#No matter what, the method needs to return a string number between 1 and 9.