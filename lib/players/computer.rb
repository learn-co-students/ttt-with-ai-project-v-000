require 'pry'

module Players
  attr_accessor :board
  class Computer < Player

    def move(board = nil)
      binding.pry
      @board = board
      self.board.cells
    end

  end

end
