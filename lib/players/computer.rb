require 'pry'
module Players
  class Computer < Player
    def move(board)
      number = rand(1...9)
      until board.valid_move?(number) == true
        move(board)
      end
      return number
    end
  end

end
