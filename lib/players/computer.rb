module Players

  class Computer < Player
    def move(board)
      valid_indexes = []
      valid_moves = board.cells.each_with_index do |space, i|
        if space == " "
          valid_indexes << i
        end
        end
        sleep 1
        indexes_without_zero = valid_indexes.collect {|space| space + 1}
        indexes_without_zero.sample.to_s
      end
    end
end
