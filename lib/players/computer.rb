module Players

  class Computer < Player

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2],
    ]


    def move(board)
      token = self.token
      if board.empty?
        "5"
      elsif self.check_combos(board) != nil
        check_combos(board)
      elsif board.cells[4] == " "
        "5"
      elsif board.cells[0] == " "
        "1"
      elsif board.cells[2] == " "
        "3"
      elsif board.cells[6] == " "
        "7"
      elsif board.cells[8] == " "
        "9"
      elsif board.cells[1] == " "
        "2"
      elsif board.cells[7] == " "
        "8"
      elsif board.cells[3] == " "
        "4"
      else
        "6"
      end
    end


    def check_combos(board)
      if
        WIN_COMBINATIONS.each do |combo|
          token = self.token
          a = combo[0]
          b = combo[1]
          c = combo[2]
            if (board.cells[a] != token && board.cells[a] != " ") && (board.cells[b] != token && board.cells[b] != " ") && board.cells[c] == " "
              return c + 1
            elsif (board.cells[a] != token && board.cells[a] != " ") && (board.cells[c] != token && board.cells[c] != " ") && board.cells[b] == " "
                return b + 1
            elsif (board.cells[b] != token && board.cells[b] != " ") && (board.cells[c] != token && board.cells[c] != " ") && board.cells[a] == " "
                return a + 1
            elsif board.cells[a] == token && board.cells[b] == token && board.cells[c] == " "
                return c + 1
            elsif board.cells[a] == token && board.cells[c] == token && board.cells[b] == " "
                return b + 1
            elsif board.cells[b] == token && board.cells[c] == token && board.cells[a] == " "
                return a + 1
            end
         end
      else
        nil
      end
    end





  end

end
