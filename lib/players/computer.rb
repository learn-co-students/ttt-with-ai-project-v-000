module Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]

    def move(board)
      #gets # Remove for tests.
      if self.token == "X"
        move_x(board)
      elsif self.token == "O"
        move_o(board)
      end
    end

    # Move for X

    def move_x(board)

      if index = one_turn_to_win(board)
        return index
      end

      if index = one_turn_to_fail(board)
        return index
      end

      case board.turn_count
        # First turn
      when 0
        "5"

        # Second turn
      when 2
        last_turn = board.cells.index("O") + 1
        if last_turn == 2 || last_turn == 4 || last_turn == 6 || last_turn == 8
          @first_o_turn_for_best_x = last_turn
          "1"
        else
          random_move(board)
        end

        # Third turn
      when 4
        if @first_o_turn_for_best_x
          if @first_o_turn_for_best_x == 2
            "7"
          else
            "3"
          end
        else
          random_move(board)
        end

        # If not best combo.
      else
        random_move(board)
      end

    end

      # Move for O

    def move_o(board)
      if index = one_turn_to_win(board)
        return index
      end

      if index = one_turn_to_fail(board)
        return index
      end

      #First turn.
      if board.turn_count == 1
        if !board.taken?(5)
          "5"
        else
          "1"
        end
      else
        random_move(board)
      end
    end

    # Helper methods

    def one_turn_to_win(board)
      result = WIN_COMBINATIONS.find do |combo|
        (board.cells[combo[0]] == self.token && board.cells[combo[1]] == board.cells[combo[0]] && !board.taken?(combo[2] + 1)) ||
        (board.cells[combo[1]] == self.token && board.cells[combo[1]] == board.cells[combo[2]] && !board.taken?(combo[0] + 1)) ||
        (board.cells[combo[0]] == self.token && board.cells[combo[2]] == board.cells[combo[0]] && !board.taken?(combo[1] + 1))
      end

      if result
        result.find { |i| !board.taken?(i + 1) } + 1
      end
    end

    def one_turn_to_fail(board)
      opposite_token = (self.token == "X" ? "O" : "X")
      result = WIN_COMBINATIONS.find do |combo|
        (board.cells[combo[0]] == opposite_token && board.cells[combo[1]] == board.cells[combo[0]] && !board.taken?(combo[2] + 1)) ||
        (board.cells[combo[1]] == opposite_token && board.cells[combo[1]] == board.cells[combo[2]] && !board.taken?(combo[0] + 1)) ||
        (board.cells[combo[0]] == opposite_token && board.cells[combo[2]] == board.cells[combo[0]] && !board.taken?(combo[1] + 1))
      end

      if result
        result.find { |i| !board.taken?(i + 1) } + 1
      end
    end

    def random_move(board)
      begin
        move = rand(1..9);
      end while board.taken?(move)
      move
    end

  end
end
