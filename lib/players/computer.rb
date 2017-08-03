require 'pry'
module Players
  class Computer < Player
    #functionality
    #when player_1
      #turn 1 should go to center
      #turn 2 should be an open corner
      #subsequent turns should block O
   #when player_2 O
     #turn 1 should be center (if not taken) or corner
     #subsequent turns should block X
    def move(board) #board is being passed in as an array returns a board move as a string
     #if computer is player_1 X
     aisles = {2 => board.cells[1], 4 => board.cells[3], 6 => board.cells[5], 8 => board.cells[7]}
     corners = {1 => board.cells[0], 3 => board.cells[2], 7 => board.cells[6], 9 => board.cells[8]}
     winning = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
     case token
     when "X"
       if board.turn_count == 0 #first turn goes to the center
         "5"
       elsif board.turn_count == 2 #second turn goes to corner
         corners.detect {|k, v| v == " "}[0].to_s
       elsif winning.detect {|win_array| (win_array.count {|e| board.cells[e] == "O"} == 2) && (win_array.none? {|e| board.cells[e] == "X"})}
         #blocks any winning combo that has 2 Os and an open spot (2 Os and a blank)
         y = winning.detect {|win_array| (win_array.count {|e| board.cells[e] == "O"} == 2) && (win_array.none? {|e| board.cells[e] == "X"})}
        (y.detect {|e| board.cells[e] == " "} + 1).to_s
      elsif winning.detect {|win_array| (win_array.count {|e| board.cells[e] == "X"} == 2) && (win_array.none? {|f| board.cells[f] == "O"})}
        #moves to any spot in a winning combo that contains 2 Xes and 1 open spot (2 Xes and blank)
        r = winning.detect {|win_array| (win_array.count {|e| board.cells[e] == "X"} == 2) && (win_array.none? {|f| board.cells[f] == "O"})}
        (y.detect {|e| board.cells[e] == " "} + 1).to_s
      else #if there is exactly 1 X and no Os in a winning combo (to blanks and an X), go first to corner, then to aisle
        aisles.detect {|k, v| v == " "}[0].to_s
      end #end X if statement

     when "O"
       if board.turn_count == 1 && board.cells[4] == " " #first turn goes to center or any corner
         "5"
       elsif board.turn_count == 1 && board.cells[4] == "X"
         corners.detect {|k, v| v == " "}[0].to_s
       else
         #blocks any winning combo that has 2 Os and an open spot (2 Os and a blank)
         y = winning.detect {|win_array| (win_array.count {|e| board.cells[e] == "X"} == 2) && (win_array.none? {|e| board.cells[e] == "O"})}
        (y.detect {|e| board.cells[e] == " "} + 1).to_s
       end #O if statement
     end #case statement
    end #def
  end #class
end #module
