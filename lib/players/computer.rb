module Players
  class Computer < Player
    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      board.cells.each do |space|
        if board.valid_move?(valid_moves[space.to_i - 1])
          valid_moves[4]
        elsif board.valid_move?(valid_moves[space.to_i - 1])
          valid_moves[0] || valid_moves[2] ||
          valid_moves[6] || valid_moves[8]
        elsif board.valid_move?(valid_moves[space.to_i - 1])
          valid_moves[1] || valid_moves[3] ||
          valid_moves[5] || valid_moves[7]
        end
        # binding.pry
      end
    end
  end
end

# a.insert(index, obj)
