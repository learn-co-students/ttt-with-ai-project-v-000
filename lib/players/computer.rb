module Players
  class Computer < Player
    def move(board)
      random = Random.new
      move = random.rand(1..9)
      if board.valid_move?(move)
        move.to_s
      else
        self.move
      end
    end
  end
end
