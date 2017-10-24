module Players
  class Computer < Player

    def move(board, game)
      input = ai_input(board, game)
      until board.valid_move?(input)
        input = random_input
      end
      input
    end

    def random_input
      (rand(9)+1).to_s
    end

    def ai_input(board, game)
      if my_ready_row(board)
        (my_ready_row_index(board) + 1).to_s
      elsif rivals_ready_row(board, game)
        (rivals_ready_row_index(board, game) + 1).to_s
      end
    end

    def now_rows(board)
      @now_rows = []
      Game::WIN_COMBINATIONS.each do |r|
        @now_rows << r.map{|i| board.cells[i]}
      end
      @now_rows
    end

    def my_ready_row(board)
      now_rows(board).index{|c| c.count(token) == 2 && c.include?(" ")}
    end

    def my_ready_row_index(board)
      row_index = my_ready_row(board)
      cell_index = @now_rows[row_index].index(" ")
      Game::WIN_COMBINATIONS[row_index][cell_index]
    end

    def rivals_ready_row(board, game)
      if game.player_1 == self
        rivals_token = game.player_2.token
      else
        rivals_token = game.player_1.token
      end

      now_rows(board).index{|c| c.count(rivals_token) == 2 && c.include?(" ")}
    end

    def rivals_ready_row_index(board, game)
      row_index = rivals_ready_row(board, game)
      cell_index = @now_rows[row_index].index(" ")
      Game::WIN_COMBINATIONS[row_index][cell_index]
    end

  end
end
