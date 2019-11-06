module Players
  class Computer < Player
    def move(board)
       board.cells.each do |space|
       computer_move = board.cells.index(space) + 1
        if board.valid_move?(computer_move)
          return computer_move.to_s
        end
        # binding.pry
      end
    end
  end
end
