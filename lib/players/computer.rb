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
      if winning_move(board)
        winning_move(board)
      elsif blocking_move(board)
        blocking_move(board)
      else
        third_move(board) if board.turn_count == 2
        second_move if board.turn_count == 1
        first_move if board.turn_count == 0
        last_ditch_move(board)
      end
    end

    def winning_move(board)
      new_move = nil
      WIN_COMBINATIONS.detect do |win_combo|
        if (board.cells[win_combo[0]] == self.token && board.cells[win_combo[1]] == self.token)
          new_move = (win_combo[2] + 1).to_s if board.cells[win_combo[2]] == " "
        elsif (board.cells[win_combo[0]] == self.token && board.cells[win_combo[2]] == self.token)
          new_move = (win_combo[1] + 1).to_s if board.cells[win_combo[1]] == " "
        elsif (board.cells[win_combo[1]] == self.token && board.cells[win_combo[2]] == self.token)
          new_move = (win_combo[0] + 1).to_s if board.cells[win_combo[0]] == " "
        end
      end
      new_move
    end

    def blocking_move(board)
      new_move = nil
      WIN_COMBINATIONS.detect do |win_combo|
        if (board.taken?(win_combo[0] + 1) && board.cells[win_combo[0]] != self.token) && (board.taken?(win_combo[1] + 1) && board.cells[win_combo[1]] != self.token)
          new_move = (win_combo[2] + 1).to_s if board.cells[win_combo[2]] == " "
        elsif (board.taken?(win_combo[0] + 1) && board.cells[win_combo[0]] != self.token) && (board.taken?(win_combo[2] + 1) && board.cells[win_combo[2]] != self.token)
          new_move = (win_combo[1] + 1).to_s if board.cells[win_combo[1]] == " "
        elsif (board.taken?(win_combo[1] + 1) && board.cells[win_combo[1]] != self.token) && (board.taken?(win_combo[2] + 1) && board.cells[win_combo[2]] != self.token)
          new_move = (win_combo[0] + 1).to_s if board.cells[win_combo[0]] == " "
        end
      end
      new_move
    end

    def third_move(board)
      if first_move == "1"
        "2" if board.cell[1] == " "
        "4" if board.cell[3] == " "
        "5" if board.cell[4] == " "
      elsif first_move == "3"
        "2" if board.cell[1] == " "
        "5" if board.cell[4] == " "
        "6" if board.cell[5] == " "
      elsif first_move == "7"
        "4" if board.cell[3] == " "
        "5" if board.cell[4] == " "
        "8" if board.cell[7] == " "
      elsif first_move == "9"
        "5" if board.cell[4] == " "
        "6" if board.cell[5] == " "
        "8" if board.cell[7] == " "
      end
    end

    def second_move
      ["2", "4", "5", "6", "8"].sample
      # see Tic Tac Toe notes
    end

    def first_move
      ["1", "3", "7", "9"].sample
    end

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
