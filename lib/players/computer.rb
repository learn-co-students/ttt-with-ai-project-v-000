module Players
  class Computer < Player
    attr_accessor :board
    def move(board)
      if board.valid_move?("5")
        "5"
      elsif board.cells[0] == board.cells[1]
        if board.valid_move?("3")
          "3"
        end
      elsif board.cells[0] == board.cells[2]
        if board.valid_move?("2")
          "2"
        end
      elsif board.cells[1] == board.cells[2]
        if board.valid_move?("1")
          "1"
        end
      elsif board.cells[0] == board.cells[3]
        if board.valid_move?("7")
          "7"
        end
      elsif board.cells[0] == board.cells[6]
        if board.valid_move?("4")
          "4"
        end
      elsif board.cells[3] == board.cells[6]
        if board.valid_move?("1")
          "1"
        end
      elsif board.cells[0] == board.cells[4]
        if board.valid_move?("9")
          "9"
        end
      elsif board.cells[3] == board.cells[4]
        if board.valid_move?("6")
          "6"
        end
      elsif board.cells[3] == board.cells[5]
        if board.valid_move?("5")
          "5"
        end
      elsif board.cells[4] == board.cells[5]
        if board.valid_move?("4")
          "4"
        end
      elsif board.cells[6] == board.cells[7]
        if board.valid_move?("9")
          "9"
        end
      elsif board.cells[6] == board.cells[8]
        if board.valid_move?("8")
          "8"
        end
      elsif board.cells[7] == board.cells[8]
        if board.valid_move?("7")
          "7"
        end
      elsif board.cells[1] == board.cells[4]
        if board.valid_move?("8")
          "8"
        end
      elsif board.cells[4] == board.cells[7]
        if board.valid_move?("2")
          "2"
        end
      elsif board.cells[2] == board.cells[5]
        if board.valid_move?("9")
          "9"
        end
      elsif board.cells[2] == board.cells[8]
        if board.valid_move?("6")
          "6"
        end
      elsif board.cells[5] == board.cells[8]
        if board.valid_move?("3")
          "3"
        end
      elsif board.cells[2] == board.cells[4]
        if board.valid_move?("7")
          "7"
        end
      elsif board.cells[4] == board.cells[6]
        if board.valid_move?("3")
          "3"
        end
      else i=1
        while i<< 9
          if board.valid_move?("#{i}")
            "i"
            return
          else
            i=i+1
          end
        end
      end
    end
  end
end
