module Players
  class Computer < Player
    WIN_COMBINATIONS = [
     [0,1,2],  # Top row
     [3,4,5],  # Middle row
     [6,7,8],  # Bottom row
     [0,3,6],  # First column
     [1,4,7],  # Middle column
     [2,5,8],  # Last column
     [0,4,8],  # Diagonal from top left to bottom right
     [6,4,2]   # Diagonal from bottom left to top right
    ]

    CORNERS = [0, 2, 6, 8]

    # Returns a valid position for the computer to move, a number between 1 and 9.
    # Contains the Tic Tac Toe AI logic.
    def move(board)

      # if player goes first and goes in a corner, play the center space
      if board.turn_count == 1 && !board.cells.include?(self.token)
        return "5"

      elsif board.turn_count == 3 && board.cells.count(self.token) == 1
        player_occupied_cells = []

        # if player has 2 tokens in the corner, play an edge
        board.cells.each_with_index do |cell, i|
          if cell == get_player_token
            player_occupied_cells << i
          end
        end

        if CORNERS.include?(player_occupied_cells[0]) && CORNERS.include?(player_occupied_cells[1])
          return "2"
        end

      else # otherwise, check if we can win or are in danger of losing
        can_win_or_lose = check_win_lose_combos(board)

        # if not in danger of losing or able to win at the moment, go for the corners, if empty
        if can_win_or_lose != nil
          can_win_or_lose.to_s
        else

          # does the list of empty positions contain any corner spaces? if so, return the first one
          empty_corner = find_empty_positions(board).detect {|position| [1, 3, 7, 9].include?(position) }

          #  if free corner spaces, return the first free one
          if empty_corner != nil
           empty_corner.to_s
          else # if there are no empty corners, return the first empty space on the board
           find_empty_positions[0].to_s
          end
        end
      end # end first turn check

    end # End Move

    # Find the empty spaces and return them as an array
    def find_empty_positions(board)
      empty_positions = []

      board.cells.each_with_index do |space, i|
        if space == " " then empty_positions << (i + 1) end
      end

      empty_positions
    end

    # Check if there is a way for me to win or stop the player from winning.
    # Returns an integer of the space to move (1-9) if there is a way to win or
    # stop the player from winning. Otherwise returns nil.
    def check_win_lose_combos(board)

      blank_space = nil
      combo_to_move_in = nil

      WIN_COMBINATIONS.each do |combination|
        array_with_moves = [
          board.cells[combination[0]],
          board.cells[combination[1]],
          board.cells[combination[2]] ]

        player_tokens_in_row = array_with_moves.count {|cell| cell == get_player_token}
        my_tokens_in_row = array_with_moves.count {|cell| cell == self.token}
        blank_spaces_in_row = array_with_moves.count {|cell| cell == " "}

        # If a possible win "row" has 2 of the human's tokens OR
        # it has 2 of my tokens, AND it has a blank space, move into the blank space
        if (player_tokens_in_row == 2 || my_tokens_in_row == 2) && (blank_spaces_in_row == 1)
           blank_space = array_with_moves.find_index {|s| s == " "}
           combo_to_move_in = combination
        end
      end

      if combo_to_move_in && blank_space
         combo_to_move_in[blank_space].to_i + 1
      else
        nil
      end
    end # end check_win_lose_combos

    # Returns the token of the other player.
    def get_player_token
      self.token == "X" ? "O" : "X"
    end

  end # end class Computer
end # end module Players
