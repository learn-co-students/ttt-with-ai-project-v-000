module Players
  class Computer < Player
    #returns a valid position for the computer to move
    def move(board)
      computer_move = rand(1..9).to_s
      if board.valid_move?(computer_move)
        computer_move
      end
    end
  end
end
