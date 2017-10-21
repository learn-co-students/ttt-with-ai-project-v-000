require 'pry'
module Players

class Computer < Player

attr_accessor :board

def move(board)

  if board.valid_move?(5)
    "5"
  elsif (board.cells[2] != " " && board.cells[2] != self.token) && (board.cells[0] != " " && board.cells[0] != self.token) && board.valid_move?(2)
    "2" #blocking top row win
  elsif (board.cells[2] != " " && board.cells[2] != self.token) && (board.cells[8] != " " && board.cells[8] != self.token) && board.valid_move?(6)
    "6" #blocking right vertical win
  elsif (board.cells[2] != " " && board.cells[2] != self.token) && (board.cells[1] != " " && board.cells[1] != self.token) && board.valid_move?(1)
    "1" #blocking top row win
  elsif (board.cells[2] != " " && board.cells[2] != self.token) && (board.cells[5] != " " && board.cells[5] != self.token) && board.valid_move?(9)
    "9" #blocking right vertical win
  elsif (board.cells[0] != " " && board.cells[0] != self.token) && (board.cells[6] != " " && board.cells[6] != self.token) && board.valid_move?(4)
    "4" #blocking left vertical win
  elsif (board.cells[0] != " " && board.cells[0] != self.token) && (board.cells[3] != " " && board.cells[3] != self.token) && board.valid_move?(7)
    "7" #blocking left vertical win
  elsif (board.cells[6] != " " && board.cells[6] != self.token) && (board.cells[7] != " " && board.cells[7] != self.token) && board.valid_move?(9)
   "9" #bottom row win
 elsif (board.cells[6] != " " && board.cells[6] != self.token) && (board.cells[8] != " " && board.cells[8] != self.token) && board.valid_move?(8)
   "8" #bottom row win
 elsif (board.cells[0] != " " && board.cells[0] != self.token) && (board.cells[4] != " " && board.cells[4] != self.token) && board.valid_move?(9)
   "9" #diagonal win
 elsif (board.cells[4] != " " && board.cells[4] != self.token) && (board.cells[8] != " " && board.cells[8] != self.token) && board.valid_move?(1)
   "1" #diagonal win
 elsif (board.cells[6] != " " && board.cells[6] != self.token) && (board.cells[4] != " " && board.cells[4] != self.token) && board.valid_move?(3)
   "3" #diagonal win
 elsif (board.cells[4] != " " && board.cells[4] != self.token) && (board.cells[2] != " " && board.cells[2] != self.token) && board.valid_move?(7)
   "7" #diagonal win
 elsif (board.cells[5] != " " && board.cells[5] != self.token) && (board.cells[4] != " " && board.cells[4] != self.token) && board.valid_move?(4)
   "4" #middle row win
 elsif (board.cells[4] != " " && board.cells[4] != self.token) && (board.cells[3] != " " && board.cells[3] != self.token) && board.valid_move?(6)
   "6" #middle row win horizontal
 elsif (board.cells[5] != " " && board.cells[5] != self.token) && (board.cells[3] != " " && board.cells[3] != self.token) && board.valid_move?(5)
   "5" #middle row win horizontal
 elsif (board.cells[1] != " " && board.cells[1] != self.token) && (board.cells[4] != " " && board.cells[4] != self.token) && board.valid_move?(8)
   "8" #middle row win horizontal
 elsif (board.cells[4] != " " && board.cells[4] != self.token) && (board.cells[7] != " " && board.cells[7] != self.token) && board.valid_move?(2)
   "2" #middle row win horizontal
 elsif (board.cells[1] != " " && board.cells[1] != self.token) && (board.cells[7] != " " && board.cells[7] != self.token) && board.valid_move?(5)
   "5" #middle row win horizontal
 else
  x = 1
  while x < 10
    if board.valid_move?(x)
    return x
    else
      x+=1
    end
  end

end #if statement
end #def move

end #class

end #module
