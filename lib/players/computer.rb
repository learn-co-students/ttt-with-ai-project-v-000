class Players
  class Computer < Player
    def move(board)
      computer_move = rand(9) + 1
      computer_move.to_s if board.valid_move?(computer_move) || move
    end
  end
end
