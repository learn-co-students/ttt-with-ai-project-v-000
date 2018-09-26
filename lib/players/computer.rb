module Players
  class Computer < Player
    def move(board)
      option = rand(1..9).to_s
      option if board.valid_move?(option)
    end
  end
end
