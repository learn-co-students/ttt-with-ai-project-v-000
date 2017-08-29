module Players
  class Computer < Player

    def move(board)
      prng = Random.new
      user_input = prng.rand(9) + 1
      board.valid_move?(user_input) ? user_input.to_s : nil
    end
  end
end
