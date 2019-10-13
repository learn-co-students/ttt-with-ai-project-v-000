module Players
  class Computer < Player
    def move(board)
      # puts "Please enter 1-9:"
      board.valid_move?(input)

    end
    binding.pry
  end
end
