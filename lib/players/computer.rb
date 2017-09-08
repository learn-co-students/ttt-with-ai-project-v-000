module Players
  class Computer < Player
    attr_accessor :difficulty
    WIN_COMBO = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]]
    CORNERS = [0, 2, 6, 8]
    DIA_CORNERS = [[0, 8], [2, 6]]
    INTERIORS = [1, 3, 5, 7]
    def initialize(token, difficulty = "H" )
      @token = token
      @difficulty = difficulty
    end
    def two_in_row?(board)
      WIN_COMBO.detect do |win|
       ((board.cells[win[0]] == board.cells[win[1]]) && board.cells[win[2]] == " " && board.cells[win[0]] != " ") ||
       ((board.cells[win[0]] == board.cells[win[2]]) && board.cells[win[1]] == " " && board.cells[win[0]] != " ") ||
       ((board.cells[win[1]] == board.cells[win[2]]) && board.cells[win[0]] == " " && board.cells[win[1]] != " ")
      end
    end
    def diagonal(board)
      DIA_CORNERS.find do |dia|
        board.cells[dia[0]] == "X" && board.cells[dia[1]] == "O" || board.cells[dia[1]] == "X" && board.cells[dia[0]] == "O"
      end
    end
    def random_move(board)
      prng = Random.new
      input = prng.rand(9) + 1
      input.to_s
    end
    def move_center(board)
      if board.valid_move?("5")
        input = "5"
      else
        nil
      end
    end
    def move_corner(board)
      if board.valid_move?("1")
        input = "1"
      elsif board.valid_move?("3")
        input = "3"
      elsif board.valid_move?("7")
        input = "7"
      elsif board.valid_move?("9")
        input = "9"
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
      if block != nil
        index = block.detect { |index| board.cells[index] == " " }
        input = (index +=1).to_s
      else
        index = board.cells.find_index(" ")
        input = (index +=1).to_s
      end
    end
    def move(board)
      case board.turn_count
      when 0 #move1
        case self.difficulty
        when "H"
          move_center(board) || move_corner(board)
        else
          random_move(board)
        end
      when 1 #move2
        case self.difficulty
        when "H"
          move_center(board) || move_corner(board)
        else
          random_move(board)
        end
      when 2 #move3
        index = INTERIORS.detect do |index|
          board.cells[index] != " "
        end
        case index
        when nil
          move_corner(board)
        when 1
          if board.valid_move?("1")
            input = "1"
          else
            input = "3"
          end
        when 4
          if board.valid_move?("1")
            input = "1"
          else
            input = "7"
          end
        when 6
          if board.valid_move?("3")
            input = "3"
          else
            input = "9"
          end
        when 8
          if board.valid_move?("7")
            input = "7"
          else
            input = "9"
          end
        end
      when 3 #move4
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
      when 4 #move5
        move_block(board)
      when 5 #move6
        move_block(board)
      when 6 #move7
        move_block(board)
      when 7 #move8
        move_block(board)
      when 8 #move9
        move_block_corner(board)
      end
    end
  end
end
