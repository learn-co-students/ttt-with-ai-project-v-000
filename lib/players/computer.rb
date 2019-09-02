module Players
  class Computer < Player

    def move(board)
      computer_move = rand(9)
      if board.valid_move?(computer_move)
        computer_move.to_s
      end
    end

  end
end
