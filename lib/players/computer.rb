require 'pry'
require 'awesome_print'

module Players
  class Computer < Player

    def move(board)
      current_move = nil
      if !board.index_taken?(4)
        current_move = 4
      else
        cells = board.cells

        near_win = Game::WIN_COMBINATIONS.find do |combo|
          x_count = 0
          o_count = 0

          combo.each do |position|
            if cells[position] == "X"
              x_count += 1
            elsif cells[position] == "O"
              o_count += 1
            end
          end

          if x_count == 2 || o_count == 2
            true
          else
            false
          end
        end

        if near_win
          current_move = near_win.find do |position|
            !board.index_taken? position
          end
        end
      end #closes if statement

      if !current_move
        current_move = [0, 2, 6, 8].find do |corner|
          !board.index_taken?(corner)
        end
      end

      if !current_move
        current_move = [1, 3, 5, 7].find do |corner|
          !board.index_taken?(corner)
        end
      end

      if !current_move
        binding.pry
      end

      return "#{current_move + 1}"
    end
  end
end

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
