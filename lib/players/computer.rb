require "pry"
module Players
  class Computer < Player

      def block(board)
        Game::WIN_COMBINATIONS.detect do |win_index|
          win_index.count {|cell| cell == " "} == 2
        end

     end

       def move(board)

        if board.turn_count == 0
         "1"
        elsif board.turn_count == 2 && board.taken?(2 || 3)
          "4"
        elsif board.turn_count == 2 && board.taken?(4 || 5 || 7)
          "2"
        elsif board.turn_count == 2 && board.taken?(6)
          "5"
        elsif board.turn_count == 2 && board.taken?(8 || 9)
          "3"
        elsif board.turn_count == 4 && board.cells[0,3] == "X" && !board.taken?(7)
          "7"
        elsif board.turn_count == 4 && board.cells[0,3] == "X" && !board.taken?(5)
          "5"
        elsif board.turn_count == 4 && board.cells[0,1] == "X" && !board.taken?(3)
          "3"
        elsif board.turn_count == 4 && board.cells[0,1] == "X" && !board.taken?(5)
          "5"
        elsif board.turn_count == 4 && board.cells[0,1] == "X" && !board.taken?(7)
          "7"
        elsif board.turn_count == 4 && board.cells[0,4] == "X" && !board.taken?(9)
          "9"
        elsif board.turn_count == 4 && board.cells[0,4] == "X" && !board.taken?(3)
          "3"
        elsif board.turn_count == 4 && board.cells[0,2] == "X" && !board.taken?(2)
          "2"
        elsif board.turn_count == 4 && board.cells[0,2] == "X" && !board.taken?(8)
          "5"
        elsif board.turn_count == 4 && board.cells[0,2] == "X" && !board.taken?(9)
          "7"
        elsif board.turn_count == 6 && board.cells[0,3,4] == "X" && !board.taken?(6)
          "6"
        elsif board.turn_count == 6 && board.cells[0,3,4] == "X" && !board.taken?(9)
          "9"
        elsif board.turn_count == 6 && board.cells[0,1,4] == "X" && !board.taken?(8)
          "8"
        elsif board.turn_count == 6 && board.cells[0,1,4] == "X" && !board.taken?(9)
          "9"
        elsif board.turn_count == 6 && board.cells[0,1,6] == "X" && !board.taken?(4)
          "4"
        elsif board.turn_count == 6 && board.cells[0,1,6] == "X" && !board.taken?(6)
          "6"
        elsif board.turn_count == 6 && board.cells[0,2,4] == "X" && !board.taken?(2)
          "2"
        elsif board.turn_count == 6 && board.cells[0,2,4] == "X" && !board.taken?(7)
          "7"
        elsif board.turn_count == 6 && board.cells[0,2,4] == "X" && !board.taken?(9)
          "9"
        elsif board.turn_count == 6 && board.cells[0,2,4] == "X" && !board.taken?(2)
          "2"
        elsif board.turn_count == 6 && board.cells[0,2,6] == "X" && !board.taken?(4)
          "4"
        elsif board.turn_count == 6 && board.cells[0,2,6] == "X" && !board.taken?(5)
          "5"
        elsif board.turn_count == 8
          rand(8..9).to_s
        end
      end

  end
end
