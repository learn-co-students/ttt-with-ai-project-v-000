require_relative '../player.rb'

module Players
  class Computer < Player

    def move(board)
      # this is where the AI logic will eventually go
      board.cells.find_index(" ") + 1
    end

  end
end
