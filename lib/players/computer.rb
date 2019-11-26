module Players
  class Computer < Player
    def move(board)
      computer_move = rand(0..9)
      until board.valid_move?(computer_move)
          computer_move = rand(0..9)
      end
       return computer_move.to_s
    end
  end
end
