module Players
  class Computer < Player
    def move(board)
      open = []

      board.cells.each_with_index {|cell, index| cell == " "? open << index : nil}

      best_move = open.select {|open_i| open_i == 4 || open_i == 0 || open_i == 2 || open_i == 6 || open_i == 8}.first

      if best_move
        open.include?(4) ? "5" : "#{best_move + 1}"
      else
        open.first + 1
      end
    end
  end
end
