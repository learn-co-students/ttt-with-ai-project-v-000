1. corner_move
  check to see if center is open if so take
  if not check to see if corners taken and take one
2. win
  go through win combinations and if our token == matches two then go for the third move.
3. block
  iterate through win combos and if other player token matches two then block where they are about to win
4. random
  (0-8) .to _a. sample

  1) When going first, take the middle square. When going second, take the middle square if it isn't yet taken.

1b) # If going second and the middle square is taken, take the upper-left corner square.

2) # If you went first (and took the middle), take a corner square with your second move.

2b) # If you went second (and took the middle) and the other player has occupied opposing corner squares, blow up the attempted trap by taking a side square.

3) # From here on, run through the WIN_COMBINATIONS array, checking whether any of the combinations have two squares filled with the same token and a third, empty square.

3a) # First, check whether you have any chances to win, since it doesn't matter whether the opponent has a chance to win if you can win first.

3b) # If you can't play any winning moves, play a move to block the opponent from winning.

4) # If none of the WIN_COMBINATIONS patterns have two squares taken by the same token and a third empty square, play into the first open square you find, first checking corners and then checking sides.
