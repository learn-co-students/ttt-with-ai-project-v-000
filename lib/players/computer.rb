module Players
  class Computer < Player
    def move(board)
      input = nil

      #if going first:
      if board.turn_count == 0
        input = rand(1..9).to_s
      elsif board.turn_count != 0
        input = [1,2,3,4,5,6,7,8,9].detect{|i|!board.taken?(i)}.to_s
      end

    end
  end
end
