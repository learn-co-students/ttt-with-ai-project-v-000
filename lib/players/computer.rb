require 'pry'

module Players
  class Computer < Player
    def move(board)

      case token
      when board.cells[0]
        case token
        when board.cells[1] then "3" if board.cells[2] == " "
        when board.cells[3] then "7" if board.cells[6] == " "
        when board.cells[4] then "9" if board.cells[8] == " "
        when board.cells[8] then "5" if board.cells[4] == " "
        when board.cells[6] then "4" if board.cells[3] == " "
        when board.cells[2] then "2" if board.cells[1] == " "
        end
      when board.cells[1]
        case token
        when board.cells[4] then "8" if board.cells[7] == " "
        when board.cells[7] then "5" if board.cells[4] == " "
        end
      when board.cells[2]
        case token
        when board.cells[4] then "7" if board.cells[6] == " "
        when board.cells[6] then "5" if board.cells[4] == " "
        when board.cells[5] then "9" if board.cells[8] == " "
        when board.cells[8] then "6" if board.cells[5] == " "
        end
      when board.cells[3]
        case token
        when board.cells[5] then "5" if board.cells[4] == " "
        when board.cells[4] then "6" if board.cells[5] == " "
        end
      end

      case opponent
      when board.cells[0]
        case opponent
        when board.cells[1] then "3" if board.cells[2] == " "
        when board.cells[3] then "7" if board.cells[6] == " "
        when board.cells[4] then "9" if board.cells[8] == " "
        when board.cells[8] then "5" if board.cells[4] == " "
        when board.cells[6] then "4" if board.cells[3] == " "
        when board.cells[2] then "2" if board.cells[1] == " "
        end
      when board.cells[1]
        case opponent
        when board.cells[4] then "8" if board.cells[7] == " "
        when board.cells[7] then "5" if board.cells[4] == " "
        end
      when board.cells[2]
        case opponent
        when board.cells[4] then "7" if board.cells[6] == " "
        when board.cells[6] then "5" if board.cells[4] == " "
        when board.cells[5] then "9" if board.cells[8] == " "
        when board.cells[8] then "6" if board.cells[5] == " "
        end
      when board.cells[3]
        case opponent
        when board.cells[5] then "5" if board.cells[4] == " "
        when board.cells[4] then "6" if board.cells[5] == " "
        end
      else
        board.cells.find_index(" ").+(1).to_s
      end
    end
  end
end
