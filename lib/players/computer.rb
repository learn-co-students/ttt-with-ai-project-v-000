module Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [2, 8, 5],
      [3, 7, 5],
      [4, 6, 5],
      [9, 1, 5],
      [7, 4, 1],
      [1, 2, 3],
      [8, 9, 7],
      [6, 3, 9]
    ]

    def move(board)
      @board = board

      if @board.cells.count(self.current_player) == 0
        if @board.cells[4] == " "
          5
        else
          random_win_combination = WIN_COMBINATIONS.sample
          random_win_combination.sample.to_s
        end

      elsif @board.turn_count == 3
        WIN_COMBINATIONS.each do |win_combination|
          if (self.board.cells[win_combination[0]]) == self.current_player
            return win_combination[1].to_s
          elsif (self.board.cells[win_combination[1]]) == self.current_player
            return win_combination[2].to_s
          elsif (self.board.cells[win_combination[2]]) == self.current_player
            return win_combination[0].to_s
          end
        end

      else
        WIN_COMBINATIONS.each do |win_combination|
          if ((self.board.cells[win_combination[0]]) == (self.board.cells[win_combination[1]])) &&
            ((self.board.cells[win_combination[0]] != " ") && (self.board.cells[win_combination[1]] != " "))
            return win_combination[2].to_s
          elsif
            ((self.board.cells[win_combination[1]]) == (self.board.cells[win_combination[2]])) &&
            ((self.board.cells[win_combination[1]] != " ") && (self.board.cells[win_combination[2]] != " "))
            return win_combination[0].to_s
          elsif
            ((self.board.cells[win_combination[0]]) == (self.board.cells[win_combination[2]])) &&
            ((self.board.cells[win_combination[0]] != " ") && (self.board.cells[win_combination[2]] != " "))
            return win_combination[1].to_s
          end
        end
      end

    end

    def current_player
      x_count = @board.cells.count {|cell| cell == "X"}
      o_count = @board.cells.count {|cell| cell == "O"}
      if x_count > o_count
        return @player_2
      else
        return @player_1
      end
    end

  end
end
