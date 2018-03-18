require_relative '../player.rb'

module Players
  class Computer < Player
    def move(board)
      if board.valid_move?(5)
        "5"
      elsif board.valid_move?(1)
        "1"
      elsif board.valid_move?(7)
        "7"
      elsif board.valid_move?(9)
        "9"
      elsif board.valid_move?(3)
        "3"
      else
        rand(1..9).to_s
      end
    end
  end
end
