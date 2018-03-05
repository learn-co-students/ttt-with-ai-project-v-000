module Players

  class Computer < Player

    def move(board)
      valid_moves = board.cells.each_index.select{|ind| board.cells[ind] == " "}

      valid_moves.map!{|move| (move+1).to_s}
      valid_moves.sample
      end

  end
end
