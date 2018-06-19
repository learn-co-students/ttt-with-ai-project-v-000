require 'pry'

module Players

  class Computer < Player
    def move(board)
      # Need to figure out how to have the computer keep playing until the game ends.
      if !board.taken?("5")
        "5"
        # sleep(5)
      elsif !board.taken?("1")
        "1"
        # sleep(5)
      elsif !board.taken?("3")
        "3"
        # sleep(5)
      elsif !board.taken?("7")
        "7"
        # sleep(5)
      elsif !board.taken?("9")
        "9"
        # sleep(5)
      elsif !board.full?
        # If the board isn't full take the first available spot
        if !board.taken?(input)
          board.cells.detect do |cell|
            cell == " "
          end
          # sleep(5)
        end
      end
    end
  end

end
