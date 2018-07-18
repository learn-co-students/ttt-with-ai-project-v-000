module Players
  class Computer < Player
    attr_accessor :board

    def move(board)
      if !board.taken?(5)
        choice = 5
      elsif !board.taken?(1)
        choice = 1
      elsif !board.taken?(3)
        choice = 3
      elsif !board.taken?(7)
        choice = 7
      elsif !board.taken?(9)
        choice = 9
      elsif !board.taken?(2)
        choice = 2
      elsif !board.taken?(4)
        choice = 4
      elsif !board.taken?(6)
        choice = 6
      elsif !board.taken?(8)
        choice = 8
      end
      "#{choice}"
    end

  end
end
