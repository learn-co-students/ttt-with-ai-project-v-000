require 'pry'

module Players

  class Computer < Player
    attr_reader :board
    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    def move(board)
      @board = board
      if @board.turn_count == 0
        "5"
      elsif @board.turn_count == 1
        corners = rand(1..4)
        "1" if corners == 1
        "3" if corners == 2
        "7" if corners == 3
        "9" if corners == 4
      elsif @board.turn_count == 2
        if (@board.cells[0] != " " && @board.cells[0] != @board.cells[4]) || (@board.cells[8] != " " && @board.cells[8] != @board.cells[4])
          choice = rand(1..2)
          "3" if choice == 1
          "7" if choice == 2
        elsif (@board.cells[2] != " " && @board.cells[2] != @board.cells[4]) || (@board.cells[6] != " " && @board.cells[6] != @board.cells[4])
          choice = rand(1..2)
          "1" if choice == 1
          "9" if choice == 2
        end
      else

        # MAKING A WINNING MOVE
        WIN_COMBINATIONS.each do |win_combination|
          win_index_1 = win_combination[0]
          win_index_2 = win_combination[1]
          win_index_3 = win_combination[2]

          position_1 = @board.cells[win_index_1]
          position_2 = @board.cells[win_index_2]
          position_3 = @board.cells[win_index_3]

          if (position_1 == self.token && position_2 == self.token  && position_3 == " ")
            return win_index_3 + 1
          elsif (position_1 == self.token && position_3 == self.token  && position_2 == " ")
            return win_index_2 + 1
          elsif (position_2 == self.token && position_3 == self.token  && position_1 == " ")
            return win_index_1 + 1
          end
        end

        # BLOCKING A WIN
        WIN_COMBINATIONS.each do |win_combination|
          win_index_1 = win_combination[0]
          win_index_2 = win_combination[1]
          win_index_3 = win_combination[2]

          position_1 = @board.cells[win_index_1]
          position_2 = @board.cells[win_index_2]
          position_3 = @board.cells[win_index_3]

          if (position_1 == position_2 && position_1 != " "  && position_1 != self.token && position_3 == " ")
            return win_index_3 + 1
          elsif (position_1 == position_3 && position_1 != " "  && position_1 != self.token && position_2 == " ")
            return win_index_2 + 1
          elsif (position_2 == position_3 && position_2 != " "  && position_2 != self.token && position_1 == " ")
            return win_index_1 + 1
          end
        end

        # BUILD TO A WIN
        WIN_COMBINATIONS.each do |win_combination|
          win_index_1 = win_combination[0]
          win_index_2 = win_combination[1]
          win_index_3 = win_combination[2]

          position_1 = @board.cells[win_index_1]
          position_2 = @board.cells[win_index_2]
          position_3 = @board.cells[win_index_3]

          if (position_1 == position_2 && position_1 == " "  && position_3 == self.token)
            return win_index_1 + 1
          elsif (position_1 == position_3 && position_1 == " "  && position_2 == self.token)
            return win_index_1 + 1
          elsif (position_2 == position_3 && position_2 == " "  && position_1 == self.token)
            return win_index_3 + 1
          end
        end

        WIN_COMBINATIONS.each do |win_combination|
          win_index_1 = win_combination[0]
          win_index_2 = win_combination[1]
          win_index_3 = win_combination[2]

          position_1 = @board.cells[win_index_1]
          position_2 = @board.cells[win_index_2]
          position_3 = @board.cells[win_index_3]

          return (win_index_1 + 1) if position_1 == " "
          return (win_index_2 + 1) if position_2 == " "
          return (win_index_3 + 1) if position_3 == " "

        end

      end
    end

  end

end
