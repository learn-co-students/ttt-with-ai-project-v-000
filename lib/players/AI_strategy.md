# AI Tic Tac Toe Strategy

First move choose middle if available. If position 5 is not taken then take corners or sides to block them.
Example strategy: Play first turn in corner and 2nd turn in center if available
samples from avaible positions.
If center is not available for 2nd turn, computer sample from available positions
Need to check if there is a position to win and if it is not taken. Take the winning position.
If no winning position avaialable, check to see if the the other player is going to win and block them if necessary.
If win combo includes your first move, look to see if any of the combos that include your first move are available.
Win combo versus block combo. Win combo is your own taken position and block is the opponents taken positions.
Need to iterate over the board.cells and collect an array of self.token.
If one move made then check for win combos that include my position. Then choose next position based on open cells in win combos.
One idea: when checking win combos also check block combos even if the game has not reached the point of looking for blocking.
Take a middle cell if empty, after 1st move take another cell based on empty cells, once everyone has 2 positions on the board check for win combo or block combo.