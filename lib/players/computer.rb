require 'pry'
require_relative "../player.rb"

module Players

  class Computer < Player

    def move(board)
      if board.taken?(5) == false
        "5"
      elsif board.taken?(1) == false
        "1"
      elsif board.taken?(3) == false
        "3"
      elsif board.taken?(7) == false
        "7"
      elsif board.taken?(9) == false
        "9"
      end
    end
  end

end
