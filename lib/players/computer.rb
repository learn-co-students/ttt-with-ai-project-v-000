module Players

  class Computer < Player
    def move(board)
      valid_indexes = []
      valid_moves = board.cells.each_with_index do |space, i|
        if space == " "
          valid_indexes << i
          binding.pry
        end
        end
        valid_indexes.sample.to_s
      end
    end

end
