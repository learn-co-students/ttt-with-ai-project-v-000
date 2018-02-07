module Players
  class Computer < Player
    def move(board)
      empty_cells = []
      board.cells.each_with_index { |c, i| empty_cells << i + 1 if c == " " }
      empty_cells.sample.to_s
    end
  end
end
