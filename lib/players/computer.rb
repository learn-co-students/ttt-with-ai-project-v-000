module Players

  class Computer < Player

    def move(board)

      @board = board

      @valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      if @board.check_block_combos != nil
        @play_move = @board.check_block_combos
      elsif @board.check_diag_combos != nil
        @play_move = @board.check_diag_combos
      else
        @play_move = @board.first_moves #I think this is broken
      end

      #if @board.valid_move?(@play_move)
        @valid_moves[@play_move.to_i - 1] = self.token
        # Error: expected ["1", "2", "3", "4", "5", "6", "7", "8", "9"] to include ""
        @play_move.to_s
      #end

    end # #move

  end # class

end # module


####### Breaks after player 1 goes for the 2nd time ##############




#
# @valid_moves.collect! do |value|
#  +        @board.valid_move?(value)
#  +        @value = value
#  +      end
#  +
#  +      input = @valid_moves.sample
#  +      @board.update(input, self)
#  +      @board.cells
#  +      @valid_moves[@value.to_i - 1] = @value
#  +      #expect(valid_moves).to include(computer_move)




#########################

# value.detect do |combo|
#
#   if cells[combo[0]] == "X" && cells[combo[1]] == "X" || cells[combo[0]] == "O" && cells[combo[1]] == "O"
#
#     if key == :block_rt
#       @play_move = (combo[1] + 1) + 1
#     elsif key == :block_lft
#       @play_move = (combo[0] + 1) - 1
#     elsif key == :block_blw
#       @play_move = (combo[1] + 1) + 3
#     elsif key == :block_abv
#       @play_move = (combo[0] + 1) - 3
#     elsif key == :hor_block_cntr
#       @play_move = (combo[0] + 1) + 1
#     elsif key == :ver_block_cntr
#       @play_move = (combo[1] + 1) - 3
#     elsif key == :diag_block_cntr
#       @play_move = 5
#     end
#
#   end
#
# end



#   else
#     choice = @valid_moves.sample
#     # @play_move = @valid_moves[choice.to_i]
#     # @play_move
#   end
#
# end

#end

# if @board.valid_move?(@play_move)
#   @play_move.to_s
# end




# @diag_block_combos.detect do |combo|
#   if @cells[value[0]] == "X" && @cells[value[1]] == "X" || @cells[value[0]] == "O" && @cells[value[1]] == "O"
#     if key == :block_up_rt
#       @play_move = 3
#     elsif key == :block_up_lft
#       @play_move = 1
#     elsif key == :block_low_rt
#       @play_move = 9
#     elsif key == :block_low_lft
#   #       @play_move = 7
#       else
#         nil
#       end # close key check
#     end # close if statement
#   end # close iteration
# end


########

# Error
#
# Welcome to Tic Tac Toe!
# ---
# Would you like to play a 0, 1, or 2-player game?
# 1
# The first player will be 'X'. Good luck!
# ---
# ---
# Your turn, X.
# ---
# Please enter your move, 1-9
# 5
#    |   |
# -----------
#    | X |
# -----------
#    |   |
# ---
# Your turn, O.
# ---
# Please enter a valid move, 1-9.
# ---
# Your turn, O.
# ---
# Please enter a valid move, 1-9.
# ---
# Your turn, O.
# ---
# Please enter a valid move, 1-9.
# ---
# Your turn, O.
# ---
# Please enter a valid move, 1-9
