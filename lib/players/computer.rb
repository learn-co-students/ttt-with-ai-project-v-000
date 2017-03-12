module Players
  class Computer < Player
    attr_reader :game

    WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]

    def move(board)
      @board = board

      if @board.cells.count(self.current_player) < 2
        random_win_combination = WIN_COMBINATIONS.sample
        random_win_combination.sample.to_s
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
            return win_combination[0].to_s
          end
        end
      end

    end

    def game=(game)
      @game = game
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
