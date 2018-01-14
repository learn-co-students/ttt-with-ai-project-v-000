module Players
  class Computer < Player
    def move(board)
      input = (Random.new.rand(9)).to_s
      # binding.pry
      if board.valid_move?(input)
        input
      else
        move(board)
      end
    end
  end
end
