How to get winning moves

1. Validate the move.
2. Can the other player block the move? If first move goes to corner, then the opponent could try to block via the center square.
3. Center? check to see if the board.cells[4] was taken. If the opponent took it, it can be blocked.
4. Corners? determine if the other player took the corner, if yes, take opposite. if no, take a corner.
5. Randomize moves?

Need to write out winning moves, blocking moves, tie, corners, center. This is needed to literally play the AI game in the CLI.
Check out the complete map of optimal Tic-tac-toe Moves - https://xkcd.com/832/

8 moves per player to win. Three corners will give three options for a win.
Avoid the edges. If a player moves to the edge, the other player will win.
