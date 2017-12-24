module Matchable
    
    ##takes in two spots and checks if they match
    ##find a way to make this more effective to refactor the rest of the code
   def match_two(board=self.board, x1, x2)
       board.cells[x1] == board.cells[x2]
   end
    
end