module Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]

    CORNERS = [0,2,6,8]

    CORNER_POSITIONS = [
      [0,8],
      [2,6]
    ]

    SIDE_POSITIONS = [
      [0,1,2],
      [2,5,8],
      [6,7,8],
      [0,3,6]
    ]

    #find open positions on board

    def open_positions(board)
      board.cells.select {|p| p == " "}
    end

    #move returns a valid position for the computer to move

    def opposing_player(cur_player)
      cur_player == "X"? "O" : "X"
    end

    def center_position_play(board)

      WIN_COMBINATIONS.each do |combo|

      pos_1 = board.cells[combo[0]] # load the value of the self.class at win_index_1
      pos_2 = board.cells[combo[1]] # load the value of the self.class at win_index_2
      pos_3 = board.cells[combo[2]] # load the value of the self.class at win_index_3

      # if player has center position, focus only on winning combinations that include center mark

        if board.cells[4] == self.token && combo.include?(4)

          #if center position is occupied and both of the other positions are valid moves, return one of the open positions

          if pos_2 == self.token && board.valid_move?(combo[0]) && board.valid_move?(combo[2])
            return ([combo[0],combo[2]].sample + 1).to_s
          end

          #if center position is occupied in addition to one of the other positions, the remaining position is a valid move, return open position

          if pos_2 == self.token && pos_1 == self.token && board.valid_move?(pos_3)
            return (combo[2] + 1).to_s
          elsif pos_2 == self.token && pos_3 == self.token && board.valid_move?(combo[0])
            return (combo[2] + 1).to_s
          end
        end
      end
    end

    def general_play(board)

      WIN_COMBINATIONS.each do |combo|

      pos_1 = board.cells[combo[0]] # load the value of the self.class at win_index_1
      pos_2 = board.cells[combo[1]] # load the value of the self.class at win_index_2
      pos_3 = board.cells[combo[2]] # load the value of the self.class at win_index_3

      pos_array = [pos_1, pos_2, pos_3]

        # Win: If the player has two in a row, they can place a third to get three in a row.

        if (pos_1 == pos_2 && pos_1 == self.token && pos_3 == " ") || (pos_2 == pos_3 && pos_2 == self.token && pos_1 == " ")
          if pos_1 == self.token
            return (combo[2] + 1).to_s
          else
            return (combo[0] + 1).to_s
          end

        # Block: If the opponent has two in a row, the player must play the third themselves to block the opponent.

        elsif (pos_1 == pos_2 && pos_1 == self.oppo_player && pos_3 == " " && pos_array.any? {|a| a != " "})  || (pos_2 == pos_3 && pos_2 == self.oppo_player && pos_1 == " " && pos_array.any? {|a| a != " "})
          if pos_1 == self.oppo_player
            return (combo[2] + 1).to_s
          else
            return (combo[0] + 1).to_s
          end

        # Fork: Create an opportunity where the player has two threats to win (two non-blocked lines of 2).

        elsif pos_1 == pos_3 && pos_1 == self.oppo_player && pos_2 == " "
            return (combo[1] + 1).to_s
          end
        end

      self.corner_play(board)
      self.side_play(board)

        # Find any empty position as last resort
      return (board.cells.index(" ") + 1).to_s
    end

    def corner_play(board)

      CORNER_POSITIONS.each do |combo|

      corner_pos_1 = board.cells[combo[0]] # load the value of the self.class at win_index_1
      corner_pos_2 = board.cells[combo[1]] # load the value of the self.class at win_index_2

      # Opposite corner: If the opponent is in the corner, the player plays the opposite corner.

        if corner_pos_1 == self.oppo_player && corner_pos_2 == " "|| corner_pos_2 == self.oppo_player && corner_pos_1 == " "
            if corner_pos_1 == " "
              return (combo[0] + 1).to_s
            else
              return (combo[1] + 1).to_s
            end
        end
      end

      # Empty corner: The player plays in a corner square.

      CORNERS.each do |c|
        return (c + 1).to_s if board.cells[c] == " "
      end #CORNER_POSITIONS
    end

    def side_play(board)

      # Empty side: The player plays in a middle square on any of the 4 sides.

      SIDE_POSITIONS.each do |s|

      side_1 = board.cells[s[0]] # load the value of the self.class at win_index_1
      side_2 = board.cells[s[1]] # load the value of the self.class at win_index_2
      side_3 = board.cells[s[2]] # load the value of the self.class at win_index_3

        if side_1 == " " && side_2 == " " && side_3 == " "
          return (s[1] + 1).to_s
        end #if side_1 == " " && side_2 == " " && side_3 == " "
      end #SIDE_POSITIONS.each.do |s|

    end

    def oppo_player
      self.opposing_player(self.token)
    end

    def move(board)

      # Center: If center position is open, take center position
      if board.cells[4] == " "
         return "5"
      elsif board.cells[4] == self.token
        self.center_position_play(board)
      end
        self.general_play(board)
    end
  end
end
