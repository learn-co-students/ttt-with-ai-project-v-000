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

    # returns a valid position for the computer to move, a number between 1 and 9
    def move(board)

      # if player goes first and goes in a corner, play center
      if board.turn_count == 1 && !board.cells.include?(self.token)
          return "5"
          # players_first_move = board.cells.find_index { |cell| cell == get_player_token }
          #
          # if players_first_move == 0 || players_first_move == 2
          #   return 2
          # elsif
          #   players_first_move == 6 || players_first_move == 8
          #   return 8
          # elsif players_first_move == nil #the player let the computer go first, so go in top left corner
          #   return 1
          # end
      elsif board.turn_count == 3 && !board.cells.include?(self.token)
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

          #puts "empty_corner is #{empty_corner}"
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

    #  puts "empty_positions is #{empty_positions}"
    #  puts "empty_positions[0].to_i is #{empty_positions[0].to_i}"
      empty_positions
    end

    # Check if there is a way for me to win or stop the player from winning
    # Return space to move if there is a way to win or stop the player from winning
    # Otherwise return nil
    def check_win_lose_combos(board)

       blank_space = nil
       combo_to_move_in = nil

      WIN_COMBINATIONS.each do |combination|
        #puts "Combination is #{combination}"
        array_with_moves = [
          board.cells[combination[0]],
          board.cells[combination[1]],
          board.cells[combination[2]] ]

        #puts "  array_with_moves is #{array_with_moves}"
        player_tokens_in_row = array_with_moves.count {|cell| cell == get_player_token}
        my_tokens_in_row = array_with_moves.count {|cell| cell == self.token}
        blank_spaces_in_row = array_with_moves.count {|cell| cell == " "}

        #puts "  player_tokens_in_row is #{player_tokens_in_row}"
        #puts "  my_tokens_in_row is #{my_tokens_in_row}"
        #puts "  blank_spaces_in_row  is #{blank_spaces_in_row }"

        # If a possible win "row" has 2 of the human's tokens OR
        # it has 2 of my tokens AND it has a blank
        # space, move into the blank space
        if ((array_with_moves.count {|cell| cell == get_player_token}) == 2 ||
           (array_with_moves.count {|cell| cell == self.token}) == 2) &&
           (array_with_moves.count {|cell| cell == " "} == 1)

           puts "!!!   TWO TOKENS IN A ROW WITH A BLANK!!"
           blank_space = array_with_moves.find_index {|s| s == " "}
           combo_to_move_in = combination
           puts "Combo to move in is #{combo_to_move_in}"
        end
            #puts "   Blank_space is #{blank_space}"
      end

      #puts "combo_to_move_in[blank_space].to_i is #{combo_to_move_in[blank_space].to_i}"

    #  if combo_to_move_in[blank_space] != nil && combo_to_move_in[blank_space].to_i.between?(0,8)
      if combo_to_move_in && blank_space
         combo_to_move_in[blank_space].to_i + 1
      else
        nil
      end
    end # end check_win_lose_combos

    # Return the token of the other player
    def get_player_token
      self.token == "X" ? "O" : "X"
    end

  end # End Class
end # End Module
