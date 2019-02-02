# AI Tic Tac Toe Strategy

## PSEUDOCODE

**Before every move:** Check to see if current player can block other player's win or secure their own win.
The logic below plays out to the point where the "block a win" and "secure a win" methods take over the game.

---

### Player 1 ("X")

- **First move:** Take the center spot.
- **Option 1:**
  - **Second move:** If "O" took an edge spot, take one of two opposite corners from edge.
  - **Third move:** Take the corner that leaves two possible win combinations.
- **Option 2:**
  - **Second move:** If "O" took a corner spot, take the opposite corner spot.
  - **Third move:** If "O" took an edge spot, take the corner that leaves two possible wins.

### Player 2 ("O")

#### Option 1

  **First move:** Take the center spot.
  **Second move:** Take an edge spot.

#### Option 2

**First move:** Take a corner spot.
**Second move:** Take a corner spot.

### Block A Win

- Iterate through win combinations array.
- For each combination array, push the value of the index of the current board into `poss_win`.
- If `poss_win` contains two of the opposite player's token and one empty space, set `player_move` as the index of that empty space plus one.

### Secure A Win

Iterate through win combinations array.
For each combination array, push the value of the index of the current board into `poss_win`.
If `poss_win` contains two of the current player's token and one empty space, set `player_move` as the index of that empty space plus one.

---

## Notes

- Possibly code out each player's moves separately
- Should add more cases for when computers are playing against _unpredictable_ humans.
- [Tic Tac Toe Logic Source](https://www.quora.com/Is-there-a-way-to-never-lose-at-Tic-Tac-Toe)

---

## Code

### Player 1 Logic

```ruby
def move(board)
  if self.token == "X"
    player_move = "5" if board.turn_count == 0
    if board.turn_count == 2
      if corner_taken(board) != nil
        player_move = corner_taken(board)
      else
        #
      end
    end
  end
  player_move
end
```

### Helper Method

```ruby
def corner_taken(board)
  if board.cells[1] == "O"
    return 9
  elsif board.cells[3] == "O"
    return 7
  elsif board.cells[7] == "O"
    return 3
  elsif board.cells[9] == "O"
    return 1
  end
end
```