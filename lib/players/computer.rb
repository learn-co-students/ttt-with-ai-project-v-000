module Players
  class Computer < Player
    def move(board)
      opposing_token = self.token == "X" ? "O" : "X"

      if win_available(board, self.token)
        play_in_empty(board, win_available(board, self.token)).to_s
      elsif win_available(board, opposing_token)
        play_in_empty(board, win_available(board, opposing_token)).to_s
      elsif [2, 3].include?(board.turn_count) && special_position(board)
        special_position(board).to_s
      else
        play_in_empty(board, [4, 0, 2, 6, 8, 1, 3, 5, 7, 9]).to_s
      end
    end

    def play_in_empty(board, cells)
      cells.detect{|cell| board.cells[cell] == " "} + 1
    end

    def win_available(board, token)
      Game::WIN_COMBINATIONS.detect do |combination|
        board.cells.values_at(*combination).sort == [" ", token, token]
      end
    end

    def special_position(board)
      if board.turn_count == 3
        case
        when board.cells.values_at(0, 4, 8) == ["X", "O", "X"]
          2
        when board.cells.values_at(2, 4, 6) == ["X", "O", "X"]
          2
        when board.cells.values_at(4, 5, 7) == ["O", "X", "X"]
          3
        when board.cells.values_at(2, 4, 7) == ["X", "O", "X"]
          6
        when board.cells.values_at(4, 5, 6) == ["O", "X", "X"]
          8
        when board.cells.values_at(0, 4, 7) == ["X", "O", "X"]
          4
        end
      elsif board.turn_count == 2
        7 if board.cells.values_at(1, 4) == ["O", "X"]
      end
    end
  end
end
