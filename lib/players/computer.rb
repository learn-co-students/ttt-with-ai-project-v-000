class Players

  class Computer < Player

    attr_reader :token, :index

    def initialize(token)
      @token = token
    end

    def move(board)
      available_moves = []
      board.cells.each_with_index do |cell, index|
        if cell == " "
          available_moves << (index + 1).to_s
        end
      end
      available_moves.sample
    end

  end
end
