class Players

  class Computer < Player

    def move(board)
      possible_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      count = 1

      if !board.taken?("5")
        "5"
      elsif !board.taken?(possible_moves[0])
        possible_moves[0]
      end
    end

  end
end
