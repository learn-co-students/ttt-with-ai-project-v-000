module Players
  class Computer < Player
    # Inherits initialize from the Player class.

    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    def potential_win_combo_X(board)
      # Checks the WIN_COMBINATIONS array to see if there are any rows or columns that have two Xs and one empty space
      WIN_COMBINATIONS.detect do |combo|
        board.position(combo[0]+1) == "X" && board.position(combo[1]+1) == "X" && board.position(combo[2]+1) == " " ||
        board.position(combo[0]+1) == "X" && board.position(combo[2]+1) == "X" && board.position(combo[1]+1) == " " ||
        board.position(combo[1]+1) == "X" && board.position(combo[2]+1) == "X" && board.position(combo[0]+1) == " "
      end
    end

    def potential_win_combo_O(board)
      # Checks the WIN_COMBINATIONS array to see if there are any rows or columns that have two Os and one empty space
      WIN_COMBINATIONS.detect do |combo|
        board.position(combo[0]+1) == "O" && board.position(combo[1]+1) == "O" && board.position(combo[2]+1) == " " ||
        board.position(combo[0]+1) == "O" && board.position(combo[2]+1) == "O" && board.position(combo[1]+1) == " " ||
        board.position(combo[1]+1) == "O" && board.position(combo[2]+1) == "O" && board.position(combo[0]+1) == " "
      end
    end

    def move(board)
      # Gives fairly explicit instructions to a computer player on which moves to play for turns 0 through 2.  Turns 3 through 8
      # are based on whether a potential win-combination from above is detected.  If it is detected, it will play in
      # that row or column for first the win, and if not the win, then the block of the win for the opponent.
      # If a potential win-combination is not detected, it will play in a random cell. (This generally only comes up later in the game
      # when a Cat's Game is likely anyways.)

      if board.turn_count == 0
        "1"
      elsif board.turn_count == 1
        board.taken?(4) ? "1" : "5"
      elsif board.turn_count == 2
        (board.valid_move?(3) && !board.taken?(2)) ? "3" : "7"
      elsif board.turn_count == 3 || board.turn_count == 5 || board.turn_count == 7
        if potential_win_combo_O(board)
          if board.position(potential_win_combo_O(board)[0]+1) == " "
            move = (potential_win_combo_O(board)[0] + 1)
          elsif board.position(potential_win_combo_O(board)[1]+1) == " "
            move = (potential_win_combo_O(board)[1] + 1)
          elsif board.position(potential_win_combo_O(board)[2]+1) == " "
            move = (potential_win_combo_O(board)[2] + 1)
          end
        elsif potential_win_combo_X(board)
          if board.position(potential_win_combo_X(board)[0]+1) == " "
            move = (potential_win_combo_X(board)[0] + 1)
          elsif board.position(potential_win_combo_X(board)[1]+1) == " "
            move = (potential_win_combo_X(board)[1] + 1)
          elsif board.position(potential_win_combo_X(board)[2]+1) == " "
            move = (potential_win_combo_X(board)[2] + 1)
          end
        else
          until board.valid_move?(move)
            move = [*1..9].sample
          end
          move
        end

      elsif board.turn_count == 4 || board.turn_count == 6 || board.turn_count == 8
        if potential_win_combo_X(board)
          if board.position(potential_win_combo_X(board)[0]+1) == " "
            move = (potential_win_combo_X(board)[0] + 1)
          elsif board.position(potential_win_combo_X(board)[1]+1) == " "
            move = (potential_win_combo_X(board)[1] + 1)
          elsif board.position(potential_win_combo_X(board)[2]+1) == " "
            move = (potential_win_combo_X(board)[2] + 1)
          end
        elsif potential_win_combo_O(board)
          if board.position(potential_win_combo_O(board)[0]+1) == " "
            move = (potential_win_combo_O(board)[0] + 1)
          elsif board.position(potential_win_combo_O(board)[1]+1) == " "
            move = (potential_win_combo_O(board)[1] + 1)
          elsif board.position(potential_win_combo_O(board)[2]+1) == " "
            move = (potential_win_combo_O(board)[2] + 1)
          end
        else
          until board.valid_move?(move)
            move = [*1..9].sample
          end
          move
        end

      end
    end
  end
end
