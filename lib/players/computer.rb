module Players
  class Computer < Player
    def move(board)
      (1 + board.cells.find_index { |c| c == " " }).to_s
    end
  end
end
