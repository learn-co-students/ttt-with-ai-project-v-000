module Players
  class Computer < Player

    def move(board)
      computer_move = rand(8)
      if board.valid_move?(computer_move)
        computer_move.to_s
      else
        move(board)
      end
    end

  end
end
