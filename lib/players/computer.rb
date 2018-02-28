require_relative '../player.rb'

module Players

  class Computer < Player

    def move(board)
      user_input = (board.cells.find_index {|cell| cell == " "} + 1).to_s
    end

  end

end
