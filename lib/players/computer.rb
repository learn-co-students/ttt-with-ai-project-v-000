module Players
  class Computer < Player
    def move(board)
      # When going first, take the middle square. When going second, take the middle square if it isn't yet taken.
       if !board.taken?(5)
         move = "5"
      # If going second and the middle square is taken, take the upper-left corner square.
      elsif board.turn_count == 1
        move = "1"
      # If you went first (and took the middle), take a corner square with your second move.

      # If you went second (and took the middle) and the other player has occupied opposing corner squares, blow up the attempted trap by taking a side square.

      # From here on, run through the WIN_COMBINATIONS array, checking whether any of the combinations have two squares filled with the same token and a third, empty square.

      # First, check whether you have any chances to win, since it doesn't matter whether the opponent has a chance to win if you can win first.

      # If you can't play any winning moves, play a move to block the opponent from winning.

      # If none of the WIN_COMBINATIONS patterns have two squares taken by the same token and a third empty square, play into the first open square you find, first checking corners and then checking sides.
      end
    end
  end
end
