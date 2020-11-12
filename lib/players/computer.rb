module Players
  require 'pry'
  class Computer < Player
    attr_accessor :board
    def move(board)

      if board.valid_move?("5")
          return  "5"
      end
      if board.cells[0] == board.cells[1]
        if board.valid_move?("3")
          return  "3"
        end
      end
      if board.cells[0] == board.cells[2]
        if board.valid_move?("2")
          return "2"
        end
      end
      if board.cells[1] == board.cells[2]
        if board.valid_move?("1")
          return   "1"
        end
      end
      if board.cells[0] == board.cells[3]
        if board.valid_move?("7")
          return "7"
        end
      end
      if board.cells[0] == board.cells[6]
        if board.valid_move?("4")
          return "4"
        end
      end
      if board.cells[3] == board.cells[6]
        if board.valid_move?("1")
          return "1"
        end
      end
      if board.cells[0] == board.cells[4]
        if board.valid_move?("9")
          return "9"
        end
      end
      if board.cells[3] == board.cells[4]
        if board.valid_move?("6")
          return "6"
        end
      end
      if board.cells[3] == board.cells[5]
        if board.valid_move?("5")
          return "5"
        end
      end
      if board.cells[4] == board.cells[5]
        if board.valid_move?("4")
          return "4"
        end
      end
      if board.cells[6] == board.cells[7]
        if board.valid_move?("9")
          return "9"
        end
      end
      if board.cells[6] == board.cells[8]
        if board.valid_move?("8")
          return "8"
        end
      end
      if board.cells[7] == board.cells[8]
        if board.valid_move?("7")
          return "7"
        end
      end
      if board.cells[1] == board.cells[4]
        if board.valid_move?("8")
          return "8"
        end
      end
      if board.cells[4] == board.cells[7]
        if board.valid_move?("2")
          return "2"
        end
      end
      if board.cells[2] == board.cells[5]
        if board.valid_move?("9")
          return "9"
        end
      end
      if board.cells[2] == board.cells[8]
        if board.valid_move?("6")
          return "6"
        end
      end
      if board.cells[5] == board.cells[8]
        if board.valid_move?("3")
          return "3"
        end
      end
      if board.cells[2] == board.cells[4]
        if board.valid_move?("7")
          return "7"
        end
      end
      if board.cells[4] == board.cells[6]
        if board.valid_move?("3")
          return "3"
        end
      end
      i=1
      while i<< 9
          if board.valid_move?("#{i}")
            return "#{i}"
          else
            i=i+1
          end
      end
    end
  end
end
