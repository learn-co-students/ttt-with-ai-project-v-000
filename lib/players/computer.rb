module Players
  class Computer < Player
    def oppontent_token
      if self.token == "0"
        "X"
      elsif self.token == "X"
        "0"
      end
    end

    def move(board)
      if !board.taken?("5")
        board = "5"
      elsif board.turn_count == 1
        board = "1"
      elsif board.turn_count == 2
        board = ["3", "7", "9"].detect do |position|
          !board.taken?(position)
        end
      elsif board.turn_count > 2 && board.turn_count < 6
        win_combo_array = []
        Game::WIN_COMBINATIONS.select do |win_combo|
          if ((board.position((win_combo[0] + 1).to_s) == opponent_token) && (board.position((win_combo[1] + 1).to_s) == opponent_token)) ||
          ((board.position((win_combo[1] + 1).to_s) == opponent_token) && (board.position((win_combo[2] + 1).to_s) == opponent_token)) ||
          ((board.position((win_combo[2] + 1).to_s) == opponent_token) && (board.position((win_combo[0] + 1).to_s) == opponent_token)) == true
          win_combo_array << win_combo
          end
        end
        number_at_index = win_combo_array[0].select do |number|
          position_number = (number + 1).to_s
          if board.position(position_number) != opponent_token
            position_number
          end
        end
        board = (number_at_index[0] + 1).to_s
      else
        win_combo_array = []
        Game::WIN_COMBINATIONS.select do |win_combo|
          if ((board.position((win_combo[0] + 1).to_s) == token) && (board.position((win_combo[1] + 1).to_s) == token)) ||
          ((board.position((win_combo[1] + 1).to_s) == token) && (board.position((win_combo[2] + 1).to_s) == token)) ||
          ((board.position((win_combo[2] + 1).to_s) == token) && (board.position((win_combo[0] + 1).to_s) == token)) == true
          win_combo_array << win_combo
          end
        end
        number_at_index = win_combo_array[0].select do |number|
          position_number = (number + 1).to_s
          if board.position(position_number) != opponent_token
            position_number
          end
        end
        board_n = (number_at_index[0] + 1).to_s
        board = final_moves(board, board_n)
      end
    end

    def final_moves(board, board_n)
      board_r = board.random
      if board_r == board_n
        final_moves(board)
      else
        board = board_r
      end
      board
    end

  end
end
