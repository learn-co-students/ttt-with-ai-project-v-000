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
      [2,4,6]
    ]

    def move(board)
      new_move = nil
      WIN_COMBINATIONS.detect do |win_combo|
        if (board.cells[win_combo[0]] == self.token && board.cells[win_combo[1]] == self.token)
          new_move = win_combo[2].to_s if board.cells[win_combo[2]] == " "
        elsif (board.cells[win_combo[0]] == self.token && board.cells[win_combo[2]] == self.token)
          new_move = win_combo[1].to_s if board.cells[win_combo[1]] == " "
        elsif (board.cells[win_combo[1]] == self.token && board.cells[win_combo[2]] == self.token)
          new_move = win_combo[0].to_s if board.cells[win_combo[0]] == " "
        elsif (board.cells[win_combo[0]] == "X" && board.cells[win_combo[1]] == "X") || (board.cells[win_combo[0]] == "O" && board.cells[win_combo[1]] == "O")
          new_move = win_combo[2].to_s if board.cells[win_combo[2]] == " "
        elsif (board.cells[win_combo[0]] == "X" && board.cells[win_combo[2]] == "X") || (board.cells[win_combo[0]] == "O" && board.cells[win_combo[2]] == "O")
          new_move = win_combo[1].to_s if board.cells[win_combo[1]] == " "
        elsif (board.cells[win_combo[1]] == "X" && board.cells[win_combo[2]] == "X") || (board.cells[win_combo[1]] == "O" && board.cells[win_combo[2]] == "O")
          new_move = win_combo[0].to_s if board.cells[win_combo[0]] == " "
        else
          new_move = last_ditch_move(board)
        end
      end
      new_move
    end
    #     if (board.cells[win_combo[0]] == self.token && board.cells[win_combo[1]] == self.token)
    #       new_move = win_combo[2].to_s unless board.cells[win_combo[2]] != " "
    #     elsif (board.cells[win_combo[0]] == self.token && board.cells[win_combo[2]] == self.token)
    #       new_move = win_combo[1].to_s unless board.cells[win_combo[1]] != " "
    #     elsif (board.cells[win_combo[1]] == self.token && board.cells[win_combo[2]] == self.token)
    #       new_move = win_combo[0].to_s == unless board.cells[win_combo[0]] != " "
    #     elsif (board.cells[win_combo[0]] == "X" && board.cells[win_combo[1]] == "X") || (board.cells[win_combo[0]] == "O" && board.cells[win_combo[1]] == "O")
    #       new_move = win_combo[2].to_s unless board.cells[win_combo[2]] != " "
    #     elsif (board.cells[win_combo[0]] == "X" && board.cells[win_combo[2]] == "X") || (board.cells[win_combo[0]] == "O" && board.cells[win_combo[2]] == "O")
    #       new_move = win_combo[1].to_s unless board.cells[win_combo[1]] != " "
    #     elsif (board.cells[win_combo[1]] == "X" && board.cells[win_combo[2]] == "X") || (board.cells[win_combo[1]] == "O" && board.cells[win_combo[2]] == "O")
    #       new_move = win_combo[0].to_s unless board.cells[win_combo[0]] != " "
    #     else
    #       new_move = last_ditch_move(board)
    #     end
    #   end
    #   new_move
    # end

    def last_ditch_move(board)
      input = (Random.new.rand(9)).to_s
      if board.valid_move?(input)
        input
      else
        last_ditch_move(board)
      end
    end

  end
end
