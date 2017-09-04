require 'pry'

module Players
  class Computer < Player

    def move(board)
      current_move = nil
      #computer 1st player, 1st move
      if !@board.taken?("5")
        current_move = "5"
      #computer 2nd player, 1st move
      elsif @board.turn_count == 1 && !@board.taken?("1") && @board.taken?("5")
        current_move = "1"
      #computer 1st player, 2nd move
      elsif @board.turn_count <= 3
        current_move = [1, 3, 7, 9].find do |corner|
        !@board.taken?(corner).to_s
        end
      else
        combo = GAME::WIN_COMBINATIONS.find do |combo|
          @board[combo[0]] == @board[combo[1]] && @board[combo[2]] == " " && @board[combo[0]] != ' '
          @board[combo[0]] == @board[combo[2]] && @board[combo[1]] == " " && @board[combo[2]] != ' '
          @board[combo[1]] == @board[combo[2]] && @board[combo[0]] == " " && @board[combo[1]] != ' '
        end
          if @board[combo[0]] == ' '
            current_move = @board[combo[0 + 1]]
          elsif @board[combo[1]] == ' '
            current_move = @board[combo[1 + 1]]
          elsif @board[board[2]] == ' '
            current_move = @board[combo[2 + 1]]
          end



      end #closes if st
    end # closes method
  end #closes class
end #closes module

# 1. Checks board positions to make sure board has open spots using the !taken? method
# 2. Takes in a string as input and puts it on board
# 3. If computer is first player place token in middle a.k.a positon 5, no need to check for turn_count
# 4. If computer is second player aka turn_count is not even, place token in corner position if position 5 has been taken else position 5
# 5. If computer went first and took the middle on first move, take an open corner. Corners = [1,3,7,9]
# 5.1 Its the third move if you went second, you wanna check if any of the other two moves match, put in path
# 6. Check if any of combos within WIN_COMBINATIONS has two spots filled through iteration
# 7. Winning! If two spots filled are my token, fill third spot with my token
# 8. Blocking! If two spots filled are NOT my token, fill thrid spot with my token
# 9. return current_move


# #computer 2nd player, 2nd move, 4th spot on board, one spot is yours, two spots aren't check if any two corners match, then block it.
# elsif @board.turn_count == 3 && @board.position("1") == @board.position("3")\
#   || @board.position("7") == @board.position("9")\
#   || @board.position("1") == @board.position("9")
#   current_move = [2, 4, 6, 8].find |corner|
#   !@board.taken?(corner)
