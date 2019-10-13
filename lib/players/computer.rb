module Players
  class Computer < Player
    def move(board)
      # puts "Please enter 1-9:"
      # move(@board)
      computer_move = computer.move(board)
      # board.valid_move?

    end
    binding.pry
  end
end
