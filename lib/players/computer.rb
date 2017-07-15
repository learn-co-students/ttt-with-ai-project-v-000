require "pry"

module Players
  class Computer < Player
    def get_entries(board)
      Game::WIN_COMBINATIONS.map {|combo| combo.map {|index| board.cells[index]}}
    end

    def opponent_token
      self.token == "X" ? "O" : "X"
    end

    def winning_move(board)
      entries = get_entries(board)
      potential_win = entries.detect { |combo| (combo.count(self.token) == 2) && combo.include?(" ") }
      if potential_win == nil
        false
      else
        winning_combo = entries.index(potential_win)
        (Game::WIN_COMBINATIONS[winning_combo][potential_win.index(" ")] + 1).to_s
      end
    end

    def blocking_move(board)
      entries = get_entries(board)
      potential_block = entries.detect { |combo| (combo.count(self.opponent_token) == 2) && combo.include?(" ") }
      if potential_block == nil
        false
      else
        blocking_combo = entries.index(potential_block)
        (Game::WIN_COMBINATIONS[blocking_combo][potential_block.index(" ")] + 1).to_s
      end
    end

    def move(board)
      move = nil
      middle = "5"
      corners = ["1", "3", "7", "9"]
      edges = ["2", "4", "6", "8"]

      if board.valid_move?(middle)
        middle
      else
        win = winning_move(board)
        block = blocking_move(board)

        if win == false && block == false
          corners.detect { |i| board.valid_move?(i) }
          if move == nil
            move = edges.detect { |i| board.valid_move?(i)}
          end
        elsif win != false
          move = win
        elsif block != false
          move = block
        end
      end
      #elsif board.turn_count == 1 || board.turn_count == 2
      #  move = corners.detect { |i| board.valid_move?(i) }
      #else
    end
  end
end

# done
