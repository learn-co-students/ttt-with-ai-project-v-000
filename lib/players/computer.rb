require_relative "../player.rb"
require "pry"

module Players
  class Computer < Player
    def move(board)
      computer_move = (1..9).to_a.sample.to_s
      # computer_move.to_s

    end
  end
end