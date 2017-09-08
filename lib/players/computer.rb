module Players
  class Computer < Player
    attr_accessor :difficulty
    def initialize(token, difficulty = "H" )
      @token = token
      @difficulty = difficulty
    end
    #constant
    WIN_COMBO = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]]
    DIA_CORNER = [[0, 8], [2, 6]]
    CORNER = [[0], [2], [6], [8]]
    INTERIOR = [1, 3, 5, 7]
      def two_in_row?(board)
        WIN_COMBO.find do |win|
         ((board.cells[win[0]] == board.cells[win[1]]) && board.cells[win[2]] == " " && board.cells[win[0]] != " ") ||
         ((board.cells[win[0]] == board.cells[win[2]]) && board.cells[win[1]] == " " && board.cells[win[0]] != " ") ||
         ((board.cells[win[1]] == board.cells[win[2]]) && board.cells[win[0]] == " " && board.cells[win[1]] != " ")
        end
      end
      def diagonal(board)
        DIA_CORNER.find do |dia|
          board.cells[dia[0]] == "X" && board.cells[dia[1]] == "O" || board.cells[dia[1]] == "X" && board.cells[dia[0]] == "O"
        end
      end
      def opposite_corners(board)
        DIA_CORNER.find do |dia|
          board.cells[dia[0]] == "X" && board.cells[dia[1]] == "X" || board.cells[dia[0]] == "O" && board.cells[dia[1]] == "O"
        end
      end
      def interior_X(board)
        INTERIOR.select { |token|  token == "X"  }
      end
      def interior_O(board)
        INTERIOR.select { |token|  token == "O"  }
      end
      def adjacent_X(board)
        if INTERIOR.select.count == 2
          case INTERIOR[0] == 1
          when NTERIOR[1] == 3
              move_corner(board)
          else
            move_block_corner(board)
          end
        end
      end
      def occupied_corner(board)
        CORNER.find do |cor|
          board.cells[cor[0]] != " "
        end
      end
      def center_token(board)
        case board.cells[4]
        when "X"
          binding.pry
          0
        when "O"
          binding.pry
          1
        end
      end
      def above_corner(board)
      end
      def below_corner(board)
      end
      def random_move(board)
        prng = Random.new
        input = prng.rand(9) + 1
        input.to_s
      end
      def move(board)
        case board.turn_count
        when 0 #X1
          random_move(board)
        when 1 #O1
          case self.difficulty
          when "H"
            move_one(board)
          else
            random_move(board)
          end
        when 2 #X2
          move_two(board)
        when 3 #O2
          block = two_in_row?(board)
          if block != nil
            index = block.detect { |index| board.cells[index] == " " }
            input = (index +=1).to_s
          elsif board.cells[4] == "X"
              move_corner(board)
          elsif board.cells[1] == " " && board.cells[7] == " "
            input = "2"
          elsif board.valid_move?("4")
            input = "4"
          else
            input = "6"
          end
        when 4 #X3
          move_block(board)
        when 5 #O3
          move_block(board)
        when 6 #X4
          move_block(board)
        when 7 #O4
          move_block(board)
        when 8 #X5
          random_move(board)
        end
      end
      def move_one(board)
        if board.valid_move?("5")
          input = "5"
        else
          move_corner(board)
        end
      end
      def move_two(board)
        if diagonal(board) != nil
          case diagonal(board)[0]
          when 0
              input = "3"
          when 2
              input = "1"
          end
        else board.cells[4] == "O"
          move_corner(board)
        end
      end
      def move_corner(board)
        if board.valid_move?("1")
          input = "1"
        elsif board.valid_move?("3")
          input = "3"
        elsif board.valid_move?("7")
          input = "7"
        else
          input = "9"
        end
      end
      def move_interior(board)
        if board.valid_move?("2")
          input = "2"
        elsif board.valid_move?("4")
          input = "4"
        elsif board.valid_move?("6")
          input = "6"
        elsif
          input = "8"
        else
          nil
        end
      end
      def move_block(board)
        block = two_in_row?(board)
        if block == nil && move_interior(board) != nil
          move_interior(board)
        else
          move_block_corner(board)
        end
      end
      def move_block_corner(board)
        block = two_in_row?(board)
        if block == nil
          move_corner(board)
        else
          index = block.detect { |index| board.cells[index] == " " }
          input = (index +=1).to_s
        end
      end
    end
  end
