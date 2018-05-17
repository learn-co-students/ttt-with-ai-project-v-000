module Players
  class Computer < Player
    def move(board)
      move = nil

      #Go for the middle
      if !board.taken?(5)
        move = "5"

      #Go for the corners, if the computer is second
      elsif board.turn_count == 1
        move = "1"

      # If you went first (and took the middle), take a corner square with your second move.
      elsif board.turn_count == 2
        move = "1"

      elsif board.turn_count == 3
        move = "3"

      elsif board.turn_count == 4
        move = "3"

      elsif board.turn_count == 5
        move = "7"

      elsif board.turn_count == 6
        move = "7"

      elsif board.turn_count == 7
        move = "9"

      elsif board.turn_count == 8
        move = "9"

      elsif board.turn_count == 9
        move = (1..9).to_a.detect do |open_spot|
          !board.taken?(open_spot)
        end
      end
    end
  end
end
