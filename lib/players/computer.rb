module Players
  class Computer < Player

    def move(board)      
      # corner_move(board)
      if !board.taken?("5")  # "5"
        "5"
      else
        random_move(board)
      end #=> 5

      # Then, always move into any available corner (maybe the opposite corner of theres)
      # go in random      
    end

    def random_move(board)
      # pick any random available position
      guess = rand(1..9)
      if !board.taken?(guess)
        return guess
      else
        random_move(board)
      end
    end

  end
end

