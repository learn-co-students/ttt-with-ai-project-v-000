module Players

  class Computer < Player

    def move(position_number)
      possible_positions = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      position_number = possible_positions.sample
    end

  end

end