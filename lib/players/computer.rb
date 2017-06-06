class Players::Computer < Player

#On turn 1 always try to go in the middle if you can
#if not "try to go in a corner"
#otherwise try a random move

def move(board)
if board.valid_move?("5")
  "5"
elsif corner_mover(board) 
    corner_move
else
  random_mover(board) 
 end
end

def corner_mover(board)
  corner_move = [1, 3, 7, 9].shuffle.first.to_s
  if board.valid_move?(corner_move)
    corner_move
  end
end

def random_mover(board)
   move = rand(1..9).to_s
   if board.valid_move?(move)
       random_move
   else
     move(board)
   end
 end

end