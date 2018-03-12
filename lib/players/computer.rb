require 'pry'

module Players
  class Computer < Player

    def move(board)
binding.pry
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      valid_moves.detect {|move| board.valid_move?(move)}
    end

    # def best_move(board)
    #   if !board.taken?("5")
    #     board.position("5")
    #   end
    #
    # end


  end
end
