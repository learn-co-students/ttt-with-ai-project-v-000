module Players
  class Computer < Player

    def move(board)
      arr = (1..9).to_a
      input = arr.sample
      until board.valid_move?(input) || arr.empty?
        arr - [input]
        input = arr.sample
      end
      input.to_s
    end
  end
end