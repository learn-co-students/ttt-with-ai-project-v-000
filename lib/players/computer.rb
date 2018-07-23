module Players
  class Computer < Player
    def move(board)
      result = Game::WIN_COMBINATIONS.detect do |combo|
        pos_1 = combo[0]
        pos_2 = combo[1]
        pos_3 = combo[2]
        array = [board[pos_1], board[pos_2], board[pos_3]]
      end
    end

    def count_for_winnable(board, win_array)
      x_count = 0
      o_count = 0
      open_count = 0
      win_array.each do |position|
          if position == "X"
            x_count += 1
          elsif position == "O"
            o_count += 1
          else
            open_count += 1
          end
      end
      check_for_winnable(x_count, o_count, open_count)
    end

    def check_for_winnable(x, o, open)
      if (x == 2 && open == 1) || (o ==2 && open == 1)
        true
      else
        false
      end
    end
  end
end
