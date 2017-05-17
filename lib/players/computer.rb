module Players
  class Computer < Player

    def opposite_token
      self.token == "X" ? "O" : "X"
    end

    def move(board)
      corners = [1, 3, 7, 9]
      if board.turn_count == 0
        return "#{corners.sample}"
      elsif board.valid_move?(5)
        return "5"
      else
        mover = nil
        Game::WIN_COMBINATIONS.detect do |win_combination|
          if board.cells[win_combination[0]] == board.cells[win_combination[1]] && board.cells[win_combination[0]] != " " && board.cells[win_combination[2]] == " "
            mover = win_combination[2]
            puts "one"
          elsif board.cells[win_combination[0]] == board.cells[win_combination[2]] && board.cells[win_combination[0]] != " " && board.cells[win_combination[1]] == " "
            mover = win_combination[1]
            puts "two"
          elsif board.cells[win_combination[1]] == board.cells[win_combination[2]] && board.cells[win_combination[1]] != " " && board.cells[win_combination[0]] == " "
            mover = win_combination[0]
            puts "three"
          end
        end
        if mover
          mover + 1
        else
          rand(1..9)
        end
      end

    end

  end
end
