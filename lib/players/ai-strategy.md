1. winning move? <br>
  a. iterate over winning combos and see if any of them have 2 cells that equal current_player.token and one valid_move?<br>
  b. winning move<br>
2. block?<br>
  a. iterate over winning combos and see if any of them have 2 cells that equal other_player.token and one valid_move?<br>
  b. blocking move<br>
3. center?<br>
  a. check if board.cells[4] is a valid move<br>
  b. take center<br>
4. corners?<br>
  a. iterate over the corners and see if any of them == other_player.token<br>
  b. if yes take the opposite corner<br>
  c. if no iterate over the corners and see if any of them == current_player.token<br>
  d. if yes take the opposite corner<br>
  e. if no take any corner<br>
5. random<br>
  a. make random move
