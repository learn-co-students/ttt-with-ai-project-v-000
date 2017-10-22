require "pry"

module Players
  class Computer < Player

    def winning_move_for_token(board, player_token)
      filled_combos = board.get_filled_win_combinations
      potential_win = filled_combos.detect { |combo| (combo.count(player_token) == 2) && combo.include?(" ") }
      if potential_win == nil
        return nil
      end
      winning_combo = filled_combos.index(potential_win)
      (Game::WIN_COMBINATIONS[winning_combo][potential_win.index(" ")] + 1).to_s
    end

    def get_valid_move(board, positions)
      positions.detect { |i| board.valid_move?(i) }
    end

    def move(board)
      # always take middle position if available = more win potential
      return Board::MIDDLE if board.valid_move?(Board::MIDDLE)

      winning_move_for_token(board, token) || # do i win
      winning_move_for_token(board, opponent_token) || # do i block
      get_valid_move(board, Board::CORNERS) || # corner next because there are more potential wins
      get_valid_move(board, Board::EDGES)
    end
  end
end
