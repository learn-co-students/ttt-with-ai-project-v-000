module Players
  class Computer < Player
    def move(board)
      move = "0"
      while !board.valid_move?(move)
        computer_move = rand(9).to_s
      end
    end
  end
end
