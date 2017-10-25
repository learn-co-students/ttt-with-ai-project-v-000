module Players
  class Computer < Player
    def move(board)
      random_move = (((rand*8).round)+1).to_s

      while !board.valid_move?(random_move)
        random_move = (((rand*8).round)+1).to_s
      end

      random_move
    end
  end
end
