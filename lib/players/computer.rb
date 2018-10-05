require_relative "../player.rb"

module Players
  class Computer < Player
    @@corner_move = [1, 3, 7, 9].sample.to_s
    @@edge_move = [2, 4, 6, 8].sample.to_s
    @@center_move = "5"
    @@random_move = (1..9).to_a.sample.to_s

    def move(board)
      # strategic moves
      if self.token == "X"
        first_player(board)
      elsif self.token == "O"
        second_player(board)
      end
    end

    def first_player(board)
      # first player strategic moves
      first_move = "5"
      if board.cells[1] == "O"
        second_move = [7, 9].sample.to_s
      elsif board.cells[3] == "O"
        second_move = [3, 9].sample.to_s
      elsif board.cells[5] == "O"
        second_move = [1, 7].sample.to_s
      elsif board.cells[9] == "O"
        second_move = [1, 3].sample.to_s
      elsif board.cells[0] == "O"
        second_move = "9"
      elsif board.cells[2] == "O"
        second_move = "7"
      elsif board.cells[6] == "O"
        second_move = "3"
      elsif board.cells[8] == "O"
        second_move = "1"
      end
      second_move
      @@random_move
    end

    def second_player(board)
      # second player strategic moves
      if board.cells[5] == "X"
        first_move = @@corner_move
      else
        first_move = "5"
      end
      first_move
      @@random_move
    end

  end
end