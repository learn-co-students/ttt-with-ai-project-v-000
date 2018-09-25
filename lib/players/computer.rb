require 'pry'

module Players
  class Players::Computer < Player
    def move(board)
      move = nil
      if !board.taken?(1)
        move = "1"
      elsif board.turn_count == 1
        move = "5"
      elsif board.turn_count == 2
        move = "3"
      elsif board.turn_count == 3
        move = [2, 4, 6, 8].detect { |i| !board.taken?(i)}.to_s
      end
    end
  end
end
