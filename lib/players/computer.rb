module Players
  class Computer < Player
    attr_reader :token

    def initialize(token)
      @token = token
    end

    def move(board)
      cells = open_cells(board)
      #this is where AI would change input
      random = cells.sample
      board.cells[random] = self.token
    end

    def open_cells(board)
      board.cells.map.with_index {|i, index| index if i == " "}
    end

  end
end
