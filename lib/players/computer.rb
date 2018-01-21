require 'pry'

module Players
  class Computer < Player
    def move(position)
      super
      # returns a valid position for the computer to move
      # The method iterates through my valid_moves array, inputs them in the valid_move? method from the board class,
      # and returns the first valid move that is valid.
      user_input = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      user_input.detect do |computer_move|
          position.valid_move?(computer_move)
      end #detect
    end # move
  end
end
