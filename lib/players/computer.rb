module Players

  class Computer < Player

    def move(board)

      input = ""

      if board.cells[4] == " " && board.cells.count {|cell| cell == " "} == 9 #middle square is empty and game is new
        input = "5"
      else
        input = rand(1..9)
      end

      if !board.valid_move?(input)
        input = "invalid"
      end

      input

    end

  end

end
