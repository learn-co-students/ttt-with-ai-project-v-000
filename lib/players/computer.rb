
module Players
  class Computer < Player

    CORNERS = [0, 2, 6, 8]

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]


    def identify_opponent
      if self.token == "X"
        opponent = "O"
      else
        opponent = "X"
      end
    end

    def move(board)
      opponent = identify_opponent
      position = rand(1..9) #initializes with random number

      if board.cells[4] == " " #changes position to centre if available
        position = 5
      end

      CORNERS.each do |corner|    #takes up free corner
        if board.cells[corner.to_i] == " "
          position = corner.to_i + 1
        end
      end

      WIN_COMBINATIONS.each do |win_combination|

        #will place second token in winning combination only if there is a chance of winning and there is at least one player token already placed
        if board.cells[win_combination[0]] == " " && (board.cells[win_combination[1]] == " " || board.cells[win_combination[1]] == self.token) && (board.cells[win_combination[2]] == " " || board.cells[win_combination[2]] == self.token)
          position = win_combination[0] + 1 unless (board.cells[win_combination[1]] == " " && board.cells[win_combination[2]] == " ")
        elsif (board.cells[win_combination[0]] == self.token || board.cells[win_combination[0]] == " "  ) && board.cells[win_combination[1]] == " " && (board.cells[win_combination[2]] == " " || board.cells[win_combination[2]] == self.token)
          position = win_combination[1] + 1 unless (board.cells[win_combination[0]] == " " && board.cells[win_combination[2]] == " ")
        elsif (board.cells[win_combination[0]] == self.token || board.cells[win_combination[0]] == " " ) && (board.cells[win_combination[1]] == " " || board.cells[win_combination[1]] == self.token) && board.cells[win_combination[2]] == " "
          position = win_combination[2] + 1 unless (board.cells[win_combination[0]] == " " && board.cells[win_combination[1]] == " ")
        #prevents losses
        elsif board.cells[win_combination[0]] == " " && board.cells[win_combination[1]] == opponent &&  board.cells[win_combination[2]] == opponent
          position = win_combination[0] + 1
        elsif board.cells[win_combination[0]] == opponent && board.cells[win_combination[1]] == " " && board.cells[win_combination[2]] == opponent
          position = win_combination[1] + 1
        elsif board.cells[win_combination[0]] == opponent && board.cells[win_combination[1]] == opponent && board.cells[win_combination[2]] == " "
          position = win_combination[2] + 1

        #prioritizes winning
        elsif board.cells[win_combination[0]] == " " && board.cells[win_combination[1]] == self.token && board.cells[win_combination[2]] == self.token
          position = win_combination[0] + 1
        elsif board.cells[win_combination[0]] == self.token && board.cells[win_combination[1]] == " " && board.cells[win_combination[2]] == self.token
          position = win_combination[1] + 1
        elsif (board.cells[win_combination[0]] == self.token && board.cells[win_combination[1]] == self.token && board.cells[win_combination[2]] == " " )
          position = win_combination[2] + 1
        end
      end
    position
	  end

  end
end
