module Players
  class Computer < Player
    def move(board)
      # puts "Please enter 1-9:"
      computer_move = board.valid_move?(@board)

    end
    binding.pry
  end
end
