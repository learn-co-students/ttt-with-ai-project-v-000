class Computer < Player
  attr_accessor :board, :rank
  def move(board)
   return rand(1..9).to_s
  end


end
=begin
WIN_COMBINATIONS = [
  [0,1,2],#row
  [3,4,5],
  [6,7,8],

  [0,3,6],#col
  [1,4,7],
  [2,5,8],

  [0,4,8],#diag
  [6,4,2]
 ]

minimax(player,board)
    if(game over in current board position)
        return winner
    children = all legal moves for player from this board
    if(max's turn)
        return maximal score of calling minimax on all the children
    else (min's turn)
        return minimal score of calling minimax on all the children
#1) Win: If you have two in a row, play the third to get three in a row.
#2) Block: If the opponent has two in a row, play the third to block them.
if 
  WIN_COMBINATIONS.each |combo|
  when combo[0] == combo[2] && board.taken?(combo[0]) == board.taken?(combo[2])
    play combo [1]

#3) Fork: Create an opportunity where you can win in two ways.

#4) Block Opponent's Fork:

#Option 1: Create two in a row to force the opponent into defending, as long as it doesn't result in them creating a fork or winning. For example, if "X" has a corner, "O" has the center, and "X" has the opposite corner as well, "O" must not play a corner in order to win. (Playing a corner in this scenario creates a fork for "X" to win.)

#Option 2: If there is a configuration where the opponent can fork, block that fork.

#5) Center: Play the center.

#6) Opposite Corner: If the opponent is in the corner, play the opposite corner.

#7) Empty Corner: Play an empty corner.

#8) Empty Side: Play an empty side.
=end