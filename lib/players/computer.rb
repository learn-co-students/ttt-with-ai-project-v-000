require 'pry'

module Players
  class Players::Computer < Player
    def move(board)
      move = nil
      if !board.taken?('5')
        move = '5'
      elsif board.turn_count == 1
        move = [1, 3, 7, 9].sample { |i| !board.taken?(i) }.to_s
      elsif board.turn_count == 2
        move = [2, 4, 6, 8].sample { |i| board.taken?(i) }.to_s
      elsif board.turn_count == 3
        move = [1, 3, 4, 6, 7, 8].sample { |i| board.taken?(i) }.to_s
      elsif board.turn_count == 4
        move = [2, 4, 7].sample { |i| board.taken?(i) }.to_s
      elsif board.turn_count == 5
        move = [1, 2, 3, 7].sample { |i| board.taken?(i) }.to_s
      elsif board.turn_count == 6
        move = [2, 3, 9, 7].sample { |i| board.taken?(i) }.to_s
      elsif board.turn_count == 7
        move = [4, 6].sample { |i| board.taken?(i) }.to_s
      elsif board.turn_count == 8
        move = [1, 2, 3, 4, 6, 8, 9].sample { |i| board.taken?(i) }.to_s
      end
    end
  end
end
