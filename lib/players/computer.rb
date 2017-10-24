module Players

  class Computer < Player

    def opponent_token
      if self.token == "O"
        "X"
      elsif self.token == "X"
        "O"
      end
    end

  #    WIN_COMBINATIONS = [
  #   [0, 1, 2], # Top row = WIN_COMBINATIONS[0] board.position((win_combo[2] + 1).to_s) == opponent_token
  #   [3, 4, 5], # Middle row = WIN_COMBINATIONS[1] board.position((win_combo[1] + 1).to_s) == opponent_token
  #   [6, 7, 8], # Bottom row = WIN_COMBINATIONS[2]
  #   [0, 3, 6], # Left column = WIN_COMBINATIONS[3]
  #   [1, 4, 7], # Middle column = WIN_COMBINATIONS[4] board.position((win_combo[1] + 1).to_s) == opponent_token
  #   [2, 5, 8], # Right column = WIN_COMBINATIONS[5] board.position((win_combo[0] + 1).to_s) == opponent_token
  #   [0, 4, 8], # Left-to-right Diagonal = WIN_COMBINATIONS[6] board.position((win_combo[1] + 1).to_s) == opponent_token
  #   [2, 4, 6] # Right-to-left Diagonal = WIN_COMBINATIONS[7] board.position((win_combo[0] + 1).to_s) == opponent_token
  # ]

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

