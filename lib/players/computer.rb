module Players
  class Computer < Player
    def move(board)
      computer_move = '5' if board.valid_move?('5')
    end
  end
end
