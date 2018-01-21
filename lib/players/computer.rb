require 'pry'

module Players
  class Computer < Player
    def move(board)
      # super
      # returns a valid position for the computer to move
      # The method iterates through my valid_moves array, inputs them in the valid_move? method from the board class,
      # and returns the first valid move that is valid.
      # Return string position the computer wants to move to
      # binding.pry
      return_value = board.cells.detect do |position|
        position_integer = board.cells.index(position) + 1
        position_string = "#{position_integer}"
        board.valid_move?(position_string)
        # binding.pry
      end
      # binding.pry
      position_integer = board.cells.index(return_value) + 1
      "#{position_integer}"
    end # move
  end
end
