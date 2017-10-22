module Players
  class Computer < Player
    attr_reader :cells
    def move(board)
      if !board.taken?(5)
        move = "5"
      elsif board.turn_count == 1
        move = "#{([0,2,6,8].sample)}"
      else
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
        end
      move
    end
  end
end
