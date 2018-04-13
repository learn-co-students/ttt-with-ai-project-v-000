module Players
  class Computer < Player
    def move(board)

      moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      corners = ["1", "3", "7", "9"]
      crosses = ["2", "4", "6", "8"]
      input = moves.sample
      corner_move = corners.sample
      cross_move = crosses.sample

      if board.valid_move?("5")
         return "5"
      elsif board.valid_move?(corner_move)
        return corner_move
      elsif board.valid_move?(cross_move)
        return cross_move
      end

      until board.valid_move?(input)
        input = moves.sample
      end
      input
    end
  end
end
