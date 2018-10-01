require_relative "../player.rb"
require "pry"

module Players
  class Computer < Player
    def move(board)
      computer_move = (1..9).to_a.sample
      while !board.full?
        computer_move if board.valid_move?(computer_move)
      end
      board.cells
    end
  end
end