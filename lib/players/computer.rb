module Players
  class Computer < Player
    def move(board)
      move = nil

  # When going first, take the middle square. If going second take the middle square if it is empty
  # If going second and the middle square is taken, take the upper left corner square.
  # If you went first (and took the middle square) choose a corner square for your second turn
  # If you went second (and took the middle square) and the other player has occupied opposing corners, foil their attemp by playing the second square
  # Now, go through each WINNING_COMBINATIONS array, checking to see if any of the combinations have two squares filled
      # Check to see if you have any chances to win
      # If you have no winning moves, play a move to block the opponent from WINNING_COMBINATIONS
  # If none of the WINNING_COMBINATIONS patterns have two squares taken by the same token and a third empty space, play the first open square, starting with corners and then sides
        if board.cells[0] == nil
           puts "5"
         else
           puts "1"
        end

      if board.cells[5] == "O"
        puts "1" || "3"|| "7" || "9"
      end
    end
  end
end
