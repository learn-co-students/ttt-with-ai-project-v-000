module Players
  class Computer < Player
    def move(board)
      # puts "Please enter 1-9:"
      computer_move = move(@board)
      valid_move?(computer_move)

    end
    binding.pry
  end
end
