module Players

  class Computer < Player

    def move(board)

      @board = board

      @valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]


      if @board.turn_count == 0 || @board.turn_count == 1
        @valid_moves.collect do |move|
          @board.valid_move?(move)
        end
          @play_move = @valid_moves.sample

      else
        if @board.check_block_combos != nil
          @play_move = @board.check_block_combos
        elsif @board.check_diag_combos != nil
          @play_move = @board.check_diag_combos
        else
          @valid_moves.collect do |move|
            @board.valid_move?(move)
          end
          @play_move = @valid_moves.sample
        end
      end

      @valid_moves[@play_move.to_i - 1] = self.token
      @play_move.to_s

    end

  end

end

#seems to glitch on turn 6

# the board below presents a problem: have I told the program what to do if none of the block conditions exist?

#ex.
# Your turn, O.
#  O |   | X
# -----------
#  X | X | O
# -----------
#  O |   |


###

#Looked really great, until it had two options, it seems

# Please enter your move, 1-9
# 5
#  X | O |
# -----------
#  X | X |
# -----------
#  O |   |
# ---
# Your turn, O.
# ---
# Please enter a valid move, 1-9.
# ---
# Your turn, O.
# ---
# Please enter a valid move, 1-9.
# ---


#then indefinite loop after I placed a token in space 8


#when comp against comp, first player begins loop immediately
