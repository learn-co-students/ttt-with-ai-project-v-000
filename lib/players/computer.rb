require "pry"
module Players
  class Computer < Player

    def move(board)
      move = nil

      if !board.taken?(1)
        move = "1"
      elsif board.turn_count == 1
        move = "3"
      elsif board.turn_count == 2
        move = [7, 9].detect{|i| !board.taken?(i)}.to_s
      elsif board.turn_count == 3
        move = [7, 9].detect{|i| !board.taken?(i)}.to_s
      else move = [2,4,5,6,8].sample.to_s
      end
    end

  end
end
