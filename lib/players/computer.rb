require 'pry'
module Players
  class Computer < Player
    def move(board)
      number = rand(1...10)
      until board.valid_move?(number) == true
        move(board)
      end
      return number.to_s
    end
  end

end
