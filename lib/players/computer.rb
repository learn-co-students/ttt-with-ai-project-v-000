module Players
  class Computer < Player
    WIN_COMBOS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

    def move(board)
      if board.cells[4] == " "
        "5"
      else
        determine_best_move(board)
      end
    end

    def determine_best_move(board)
      score_arr = score_combos(board)
      move = Random.rand(1..9)
      if score_arr.include?(2)
        WIN_COMBOS[score_arr.index(2)].each do |index|
          if board.cells[index] == " "
            move = index + 1
          end
        end
      elsif score_arr.include?(-2)
        WIN_COMBOS[score_arr.index(-2)].each do |index|
          if board.cells[index] == " "
            move = index + 1
          end
        end
      end
      move
    end

    def score_combos(board)
      score_arr = [0,0,0,0,0,0,0,0]
      cells = board.cells
      i = 0
      while i < 8 do
        score_arr[i] = [cells[WIN_COMBOS[i][0]], cells[WIN_COMBOS[i][1]], cells[WIN_COMBOS[i][2]]].count(@token) - [cells[WIN_COMBOS[i][0]], cells[WIN_COMBOS[i][1]], cells[WIN_COMBOS[i][2]]].count(self.token_2)
        i += 1
      end
      score_arr
    end

    def token_2
      if @token == "X"
        @token_2 = "O"
      else
        @token_2 = "X"
      end
    end

  end
end
