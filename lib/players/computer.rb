require 'pry'

module Players
  class Computer < Player

      def move(board)
        test = [1,2,3,4,5,6,7,8,9]
        if board.valid_move?(5)
          "5"
        elsif board.valid_move?(1) == nil
          test.to_s
        end
      end

    end
  end
