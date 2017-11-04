module Players

  class Computer < Player
    def move(board)
      random = "#{rand(1..9)}"
      !board.valid_move?(random) ? move(board) : random
    end
  end

end
