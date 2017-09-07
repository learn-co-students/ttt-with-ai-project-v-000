
module Players
  class Computer < Player

    def move(board)
      current_move = nil
      if !board.index_taken?(3)
        current_move = 3
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
      end

      if !current_move
        current_move = [0, 2, 6, 8].find do |corner|
          !board.index_taken?(corner)
        end
      end

      if !current_move
        current_move = [1, 3, 5, 7].find do |middle|
          !board.index_taken?(middle)
        end
      end

      return "#{current_move + 1}"
    end
  end
end
