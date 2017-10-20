require 'pry'
module Players
  class Computer < Player
    def move(board)
      if board.valid_move?(5) == true
        5.to_s
      elsif [1,3,7,9].any?{|p| board.valid_move?(p)}
        move = [1,3,7,9].detect?{|p| board.valid_move?(p)}
      else number = rand(1...10)
        until board.valid_move?(number) == true
          move(board)
        end
        return number.to_s
      end
    end
  end

end
