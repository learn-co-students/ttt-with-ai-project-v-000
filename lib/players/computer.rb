require 'pry'

module Players
  class Computer < Player

    def move(board)
      best_move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      valid_moves.detect {|move| board.valid_move?(move)}
      #binding.pry
    end

    def best_move(board)
      case board
      when board.valid_move?("5")
        board.position("5")
      when board.valid_move?("3")
        board.postiion("3")
      when board.valid_move?("1")
        board.position("1")
      end
    end


  end
end
