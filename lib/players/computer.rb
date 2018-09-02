module Players
  class Computer < Player
    @win_combinations = [
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
      moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      corners = ["1", "3", "7", "9"]

      if !board.taken?(5)
        "5"
      elsif board.turn_count == 1
        "1"
      elsif board.turn_count == 2
        if corners.select {|i| !board.taken?(i)}.include?("1") && corners.select {|i| !board.taken?(i)}.include?("9")
          "1"
        elsif corners.select {|i| !board.taken?(i)}.include?("3") && corners.select {|i| !board.taken?(i)}.include?("7")
          "3"
        end
      else
        if Game::WIN_COMBINATIONS.detect {|combo| board.cells.values_at(combo[0], combo[1], combo[2]).count {|cell| cell == self.token} == 2 && board.cells.values_at(combo[0], combo[1], combo[2]).include?(" ")}

          Game::WIN_COMBINATIONS.detect {|combo|
            board.cells.values_at(combo[0], combo[1], combo[2]).count {|cell| cell == self.token} == 2 && board.cells.values_at(combo[0], combo[1], combo[2]).include?(" ")
          }.detect {|i|
            board.position(i+1) == " "
          } + 1

        elsif Game::WIN_COMBINATIONS.detect {|combo| board.cells.values_at(combo[0], combo[1], combo[2]).count {|cell| cell != self.token && cell != " "} == 2 && board.cells.values_at(combo[0], combo[1], combo[2]).include?(" ")}

          Game::WIN_COMBINATIONS.detect {|combo|
            board.cells.values_at(combo[0], combo[1], combo[2]).count {|cell| cell != self.token && cell != " "} == 2 && board.cells.values_at(combo[0], combo[1], combo[2]).include?(" ")
          }.detect {|i|
            board.position(i+1) == " "
          } + 1

        else
          moves.detect {|move| !board.taken?(move)}
        end
      end

    end

  end

end
