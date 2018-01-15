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
      WIN_COMBINATIONS.each do |win_combo|
        if (board.cells[win_combo[0]] == "X" && board.cells[win_combo[1]] == "X") || (board.cells[win_combo[0]] == "O" && board.cells[win_combo[1]] == "O")
          new_move = win_combo[2].to_s
        elsif (board.cells[win_combo[0]] == "X" && board.cells[win_combo[2]] == "X") || (board.cells[win_combo[0]] == "O" && board.cells[win_combo[2]] == "O")
          new_move = win_combo[1].to_s
        elsif (board.cells[win_combo[1]] == "X" && board.cells[win_combo[2]] == "X") || (board.cells[win_combo[1]] == "O" && board.cells[win_combo[2]] == "O")
          new_move = win_combo[0].to_s
        else
          input = (Random.new.rand(9)).to_s
          if board.valid_move?(input)
            new_move = input
          else
            move(board)
          end
        end
      end
      new_move
    end

    #   input = (Random.new.rand(9)).to_s
    #   if board.valid_move?(input)
    #     input
    #   else
    #     move(board)
    #   end
    # end

  end
end
