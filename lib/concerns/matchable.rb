module Matchable
    
#   def match_two(board=self.board, x1, x2)
#       board.cells[x1] == board.cells[x2]
#   end
   
   def match_two_and(board=self.board, i1, i2, i3)
       board.cells[i1] == board.cells[i2] && board.cells[i1] == board.cells[i3]
   end
   
   def match_two_or(board=self.board, i1, i2, i3)
       board.cells[i1] == board.cells[i2] || board.cells[i1] == board.cells[i3]
   end
    
end