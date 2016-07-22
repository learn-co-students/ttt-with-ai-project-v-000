1. winning move? <br>
  a. iterate over winning combos and see if any of them have 2 cells that equal current_player.token and one valid_move?
  b. winning move
2. block?<br>
  a. iterate over winning combos and see if any of them have 2 cells that equal other_player.token and one valid_move?
  b. blocking move
3. center?<br>
  a. check if board.cells[4] is a valid move
  b. take center
4. corners?<br>
  a. iterate over the corners and see if any of them == other_player.token
  b. if yes take the opposite corner
  c. if no iterate over the corners and see if any of them == current_player.token
  d. if yes take the opposite corner
  e. if no take any corner
5. random<br>
  a. make random move
