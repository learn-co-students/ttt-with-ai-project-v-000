require 'pry'

module Players
  class Computer < Player

    attr_reader :computer_move

    def move(board)
      ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
    end

  end
end
