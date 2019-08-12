module Players
  class Computer < Player
    attr_reader :token

    def move(board)
      random_move = rand(1..9).to_s
      !board.valid_move?(random_move) ? move(board) : random_move
    end
  end
end
