require 'pry'
module Players
  class Computer < Player
    WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    def move(board) #board is being passed in as an array returns a board move as a string
     #if computer is player_1 X
     corners = {1 => board.cells[0], 3 => board.cells[2], 7 => board.cells[6], 9 => board.cells[8]}
     case token
     when "X"
       if board.turn_count == 0
         #first turn goes to the center
         "5"
       elsif board.turn_count == 2 #second turn goes to corner
         corners.detect {|k, v| v == " "}[0].to_s
       else
         (WIN_COMBINATIONS.detect do |win_array| #iterate over winning combinations to find arrays that contain 2 Xes
           win_array.count {|e| board.cells[e] == "O"}  == 2
         end).detect {|e| board.cells[e] == " "}.to_s
       end

     when "O"
       if board.turn_count == 1 && board.cells[4] == " " #first turn goes to center or any corner
         "5"
       else
         (WIN_COMBINATIONS.detect do |win_array| #iterate over winning combinations to find arrays that contain 2 Xes
           win_array.count {|e| board.cells[e] == "X"}  == 2
         end).detect {|e| board.cells[e] == " "}.to_s
       end #O if statement
     end #case statement
       #any corner 1, 3, 7, 9
          #turn 2 should be a corner if O takes an aisle
            #should be 1 of 2 corners opposite the corner O occupies
          #turn 3 should block O
      #player_2 O
        #turn 1 should be center (if not taken) or corner
        #turn 2 should block X
    end #def
  end #class
end #module
