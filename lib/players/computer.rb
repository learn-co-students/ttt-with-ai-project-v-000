module Players
  class Computer < Player

    def move(board)

        input = rand(1..9)

        while !board.valid_move?(input)
          input = rand(1..9)
        end
        return  input.to_s
    end
  end
end
