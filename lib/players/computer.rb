
module Players

  class Computer < Player

    def move(board)
      valid_move_possibilities = ["", " "]
      computer_array = board.cells.map.with_index do |a, index|
        if valid_move_possibilities.include?(a)
          input = index + 1
          input.to_s
        end
      end
      if computer_array.sample != nil
        computer_array.sample
      end
    end

  end

end
