module Players
  class Computer < Player
    def move(board)
      if !board.full?
        current_state = board.cells
        open_moves = []
        current_state.map{|c| open_moves << current_state.index(c) if c == " "}
        open_moves.sample.to_i + 1
      end
    end
  end
end
