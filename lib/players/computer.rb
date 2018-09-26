module Players
  class Computer < Player
    def move(board)
      possible_move = rand(1..9).to_s
      possible_move if board.valid_move?(possible_move)
    end
  end
end
