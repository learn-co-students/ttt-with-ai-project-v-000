module Players

  class Computer < Player

    attr_accessor :board

    CORNER_CELLS = [0, 2, 6, 8]
    CROSS_CELLS = [1, 3, 5, 7]

    def winning_move
      three_in_a_row = Game::WIN_COMBINATIONS.find do |win_combination|
        (board.cells[win_combination[0]] == token &&
        board.cells[win_combination[1]] == token &&
        board.cells[win_combination[2]] == " ") ||
        (board.cells[win_combination[0]] == token &&
        board.cells[win_combination[1]] == " " &&
        board.cells[win_combination[2]] == token) ||
        (board.cells[win_combination[0]] == " " &&
        board.cells[win_combination[1]] == token &&
        board.cells[win_combination[2]] == token)
      end
      winning_cell = three_in_a_row.find { |cell| board.cells[cell] == " " } if three_in_a_row != nil
    end

    def opponent_token
      token == "X" ? "O" : "X"
    end

    def block!
      opponent_three_in_a_row = Game::WIN_COMBINATIONS.find do |win_combination|
        (board.cells[win_combination[0]] == opponent_token &&
        board.cells[win_combination[1]] == opponent_token &&
        board.cells[win_combination[2]] == " ") ||
        (board.cells[win_combination[0]] == opponent_token &&
        board.cells[win_combination[1]] == " " &&
        board.cells[win_combination[2]] == opponent_token) ||
        (board.cells[win_combination[0]] == " " &&
        board.cells[win_combination[1]] == opponent_token &&
        board.cells[win_combination[2]] == opponent_token)
      end
      if opponent_three_in_a_row != nil
        opponent_winning_cell = opponent_three_in_a_row.find { |cell| board.cells[cell] == " " }
      end
    end

    def set_up_winning_move
      three_in_a_row_to_be = Game::WIN_COMBINATIONS.find do |win_combination|
        (board.cells[win_combination[0]] == token &&
        board.cells[win_combination[1]] == " " &&
        board.cells[win_combination[2]] == " ") ||
        (board.cells[win_combination[0]] == " " &&
        board.cells[win_combination[1]] == token &&
        board.cells[win_combination[2]] == " ") ||
        (board.cells[win_combination[0]] == " " &&
        board.cells[win_combination[1]] == " " &&
        board.cells[win_combination[2]] == token)
      end
      winning_cell_to_be = three_in_a_row_to_be.find { |cell| board.cells[cell] == " " } if three_in_a_row_to_be != nil
    end

    def block_potential_winning_move
      opponent_three_in_a_row_to_be = Game::WIN_COMBINATIONS.find do |win_combination|
        (board.cells[win_combination[0]] == opponent_token &&
        board.cells[win_combination[1]] == " " &&
        board.cells[win_combination[2]] == " ") ||
        (board.cells[win_combination[0]] == " " &&
        board.cells[win_combination[1]] == opponent_token &&
        board.cells[win_combination[2]] == " ") ||
        (board.cells[win_combination[0]] == " " &&
        board.cells[win_combination[1]] == " " &&
        board.cells[win_combination[2]] == opponent_token)
      end
      if opponent_three_in_a_row_to_be != nil
        opponent_winning_cell_to_be = opponent_three_in_a_row_to_be.find { |cell| board.cells[cell] == " " }
      end
    end

    def middle_cell
      board.cells[4] == " "
    end

    def corner_cell
      CORNER_CELLS.shuffle!.find { |cell| board.cells[cell] == " " }
    end

    def opposite_corner_cell
      1 if board.taken?(9) && !board.taken?(1)
      3 if board.taken?(7) && !board.taken?(3)
      7 if board.taken?(3) && !board.taken?(7)
      9 if board.taken?(1) && !board.taken?(9)
    end

    def cross_cell
      CROSS_CELLS.shuffle!.find { |cell| board.cells[cell] == " " }
    end

    def move(board)
      @board = board
      sleep 1.5
      case
        when winning_move != nil
          current_move = winning_move + 1
        when block! != nil
          current_move = block! + 1
        when set_up_winning_move != nil
          current_move = set_up_winning_move + 1
        when middle_cell
          current_move = "5"
        when opposite_corner_cell != nil && !board.taken?(opposite_corner_cell)
          current_move = opposite_corner_cell
        when corner_cell
          current_move = corner_cell + 1
        when block_potential_winning_move != nil
          current_move = block_potential_winning_move + 1
        when cross_cell
          current_move = cross_cell + 1
      end
    end

  end

end
