module Players
  class Computer < Player
    attr_reader :move, :open

    def open_spaces(board)
      @open = []
      board.cells.each_with_index do |cell, i|
        @open << (i+1).to_s if cell == " "
      end
      @open
    end

    def move(board)
      spaces = open_spaces(board)
      @move = spaces[0]
      @move
    end
  end
end
