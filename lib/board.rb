class Board

    attr_accessor :board, :cells

    def initialize(board)
        @board = ["","","","","","","","",""]
    end

    def cells(cell)
        @cells
    end

    def self.reset
        @board = ["","","","","","","","",""]
    end
end
