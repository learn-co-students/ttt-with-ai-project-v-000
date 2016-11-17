require 'pry'

module Players

  class Computer < Player
    attr_reader :board

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

        # BLOCKING A WIN

        # BUILD TO A WIN
      end
    end

  end

end
