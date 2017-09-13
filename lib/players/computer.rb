module Players
  class Computer < Player

    #find open positions on board

    def open_positions(board)
      board.cells.select {|p| p == " "}
    end

    #move  a valid position for the computer to move

    def opposing_player(cur_player)
      cur_player == "X"? "O" : "X"
    end

    def center_position_play(board)

      Game::WIN_COMBINATIONS.each do |combo|

      pos_1 = board.cells[combo[0]]
      pos_2 = board.cells[combo[1]]
      pos_3 = board.cells[combo[2]]

        if board.cells[4] == self.token && combo.include?(4)

          #if center position is occupied and both of the other positions are valid moves, one of the open positions

          if pos_2 == self.token && board.valid_move?(combo[0]) && board.valid_move?(combo[2])
            ([combo[0],combo[2]].sample + 1).to_s
          end

          #if center position is occupied in addition to one of the other positions, the remaining position is a valid move, open position

          if pos_2 == self.token && pos_1 == self.token && board.valid_move?(pos_3)
            (combo[2] + 1).to_s
          elsif pos_2 == self.token && pos_3 == self.token && board.valid_move?(combo[0])
            (combo[2] + 1).to_s
          end
        end
      end
    end

    def move(board)

      # set variable for opposing player and position arrays

      oppo_player = self.opposing_player(self.token)

      corner_positions = [[0,8],[2,6]]
      corners = [0,2,6,8]
      side_positons = [[0,1,2], [2,5,8], [6,7,8], [0,3,6]]

      # Center: If center position is open, take center position

      if board.cells[4] == " "
        "5"

      # if player has center position, focus only on winning combinations that include center mark

      elsif board.cells[4] == self.token
        self.center_position_play(board)
      end

      Game::WIN_COMBINATIONS.each do |combo|

      pos_1 = board.cells[combo[0]]
      pos_2 = board.cells[combo[1]]
      pos_3 = board.cells[combo[2]]

      pos_array = [pos_1, pos_2, pos_3]

        # If the player has two in a row, place a third to get three in a row.

        if (pos_1 == pos_2 && pos_1 == self.token && pos_3 == " ") || (pos_2 == pos_3 && pos_2 == self.token && pos_1 == " ")
          if pos_1 == self.token
            (combo[2] + 1).to_s
          else
            (combo[0] + 1).to_s
          end

        # Block: If the opponent has two in a row, the player must play the third themselves to block the opponent.

        elsif (pos_1 == pos_2 && pos_1 == oppo_player && pos_3 == " " && pos_array.any? {|a| a != " "}) || (pos_2 == pos_3 && pos_2 == oppo_player && pos_1 == " " && pos_array.any? {|a| a != " "})
          if pos_1 == oppo_player
            (combo[2] + 1).to_s
          else
            (combo[0] + 1).to_s
          end

        # Create an opportunity where the player has two threats to win (two non-blocked lines of 2).

        elsif pos_1 == pos_3 && pos_1 == oppo_player && pos_2 == " "
            (combo[1] + 1).to_s
          end
        end

      #Test corner positions for play opportunities

      corner_positions.each do |combo|

      corner_pos_1 = board.cells[combo[0]]
      corner_pos_2 = board.cells[combo[1]]

      # Opposite corner: If the opponent is in the corner, the player plays the opposite corner.

        if corner_pos_1 == oppo_player && corner_pos_2 == " "|| corner_pos_2 == oppo_player && corner_pos_1 == " "
            if corner_pos_1 == " "
              (combo[0] + 1).to_s
            else
              (combo[1] + 1).to_s
            end
        end
      end

      # Empty corner: The player plays in a corner square.

      corners.each do |c|
        (c + 1).to_s if board.cells[c] == " "
      end

      side_positons.each do |s|

        side_1 = board.cells[s[0]]
        side_2 = board.cells[s[1]]
        side_3 = board.cells[s[2]]

        if side_1 == " " && side_2 == " " && side_3 == " "
          (s[1] + 1).to_s
        end
      end

      # Find any empty position as last resort
      (board.cells.index(" ") + 1).to_s
    end
  end
end
