module Players
  class Computer < Player
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

      def interior_X(board)
        INTERIOR.select { |index|  index == "X"  }
      end

      def interior_O(board)
        INTERIOR.select { |index|  index == "O"  }
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

      def random_move(board)
        prng = Random.new
        input = prng.rand(9) + 1
        input.to_s
      end

      def move(board)
        case board.turn_count
        when 0
          random_move(board)
        when 1
          #input = "9"
          move_one(board)
        when 2
          move_two(board)
        when 3
          move_block_corner(board)
        when 4
          move_block(board)
        when 5
          move_block(board)
        when 6
          move_block(board)
        when 7
          move_block(board)
        when 8
          random_move(board)
        end
      end

      def occupied_corner(board)
        CORNER.find do |cor|
          board.cells[cor[0]] != " "
        end
      end

      def move_one(board)
        if occupied_corner(board) != nil
          input = "5"
        elsif board.valid_move?("5")
          input = "5"
        else
          move_corner(board)
        end
      end

      def move_two(board)
        if diagonal(board) != nil
          binding.pry
          case diagonal(board)[0]
          when 0
              input = "3"
          when 2
              input = "1"
          end
        else
          move_block(board)
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
