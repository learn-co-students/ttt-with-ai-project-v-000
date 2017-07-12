module Players
  class Computer < Player
    def move(board)
      move = nil

      if !board.taken?("5")
        move = "5"
        # take middle position initially
      elsif board.turn_count == 1
        move = [1, 3, 7, 9].detect { |i| !board.taken?(i) }.to_s
        # go in a corner if this is not the first turn

        # NEED TO FINISH CHECKING FOR POTENTIAL MOVES
      end

    end
  end
end
