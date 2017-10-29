require 'pry'

class Players::Computer
  def move(array)
    valid_moves = []
    i = 0
    until i > 9
      if array.valid_move?(i) == true
        valid_moves << i
      end
      i += 1
    end
    valid_moves.sample.to_s
  end
end
