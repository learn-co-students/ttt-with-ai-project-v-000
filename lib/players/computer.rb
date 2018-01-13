module Players

  class Computer < Player

    def move(board)

      @board = board

      @valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      if @board.check_block_combos == nil && @board.check_diag_combos == nil
        @play_move = @valid_moves.sample
      elsif @board.check_block_combos != nil
        @play_move = @board.check_block_combos
      elsif @board.check_diag_combos != nil
        @play_move = @board.check_diag_combos
      end

      @valid_moves[@play_move.to_i - 1] = self.token
      @play_move.to_s

    end

  end

end

#seems to glitch on turn 6

#ex.
# Your turn, O.
#  O |   | X
# -----------
#  X | X | O
# -----------
#  O |   |

#then indefinite loop after I placed a token in space 8
