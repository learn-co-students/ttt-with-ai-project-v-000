module Players
  class Computer < Player
    def move(board)
       board.cells.each do |space|
       space = board.cells.index(space)
        if board.cells.include?(space)
          space.to_s
        end
        binding.pry
      end
    end
  end
end
