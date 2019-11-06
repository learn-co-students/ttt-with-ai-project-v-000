require 'pry'
module Players

  class Computer < Player

    def move(board = nil)
      @board = board
      if board.valid_move?("5")
        "5"
      elsif board.turn_count == 1
        "1"
      elsif close_to_winning?
        close_to_winning?
      elsif board.turn_count == 3
        ["3", "7", "9"].sample
      else
        ["1", "2", "3", "4", "6", "7", "8", "9"].sample
      end
    end

    WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]

    def offense
      WIN_COMBINATIONS.detect do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = @board.cells[win_index_1]
        position_2 = @board.cells[win_index_2]
        position_3 = @board.cells[win_index_3]

        if (position_1 == "O" && position_2 == "O" && position_3 != "X") || (position_2 == "O" && position_3 == "O" && position_1 != "X") || (position_1 == "O" && position_3 == "O" && position_2 != "X")
          true
        end
      end
    end

    def defense
      WIN_COMBINATIONS.detect do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = @board.cells[win_index_1]
        position_2 = @board.cells[win_index_2]
        position_3 = @board.cells[win_index_3]

        if (position_1 == "X" && position_2 == "X" && position_3 != "O") || (position_2 == "X" && position_3 == "X" && position_1 != "O") || (position_1 == "X" && position_3 == "X" && position_2 != "O")
            true
        end
      end
    end

    def close_to_winning?
      if offense
        winning_array = offense
      elsif defense
        winning_array = defense
      end

      if winning_array
        if @board.cells[winning_array[0]] == " "
          winning_array[0] + 1
        elsif @board.cells[winning_array[1]] == " "
          winning_array[1] + 1
        elsif @board.cells[winning_array[2]] == " "
          winning_array[2] + 1
        end
      end

    end
  end
end
