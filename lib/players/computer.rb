class Players
  class Computer < Player
    attr_accessor :board

    #this isn't great but it works for now.

    def move(board)
      first_move(board) || computer_moves(board)
    end

    def first_move(board)
      if board.cells[4] == " "
        "5"
      else
        other_moves(board)
      end
    end

    def computer_moves(board)
      if board.cells[4] == "X" || board.cells[4] == "O" && boards.cells[0] == " "
        "1"
      elsif board.cells[4] == "X" || board.cells[4] == "O" && boards.cells[8] == " "
        "9"
      elsif board.cells[4] == "X" || board.cells[4] == "O" && boards.cells[2] == " "
        "3"
      elsif board.cells[4] == "X" || board.cells[4] == "O" && boards.cells[6] == " "
        "7"
      elsif board.cells[4] == "X" || board.cells[4] == "O" && boards.cells[3] == " "
        "4"
      elsif board.cells[4] == "X" || board.cells[4] == "O" && boards.cells[5] == " "
        "6"
      end
    end

    def other_moves(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      valid_moves.shuffle.find {|x| board.cells[x.to_i-1] == " "}
    end
  end
end
