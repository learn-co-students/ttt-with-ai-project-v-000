module Players
  class Computer < Player
    attr_accessor :board

    def move(board)
      @board = board
      @valid_moves = []
      @board.cells.each.with_index(1) do |cell, index|
        if cell == " "
          @valid_moves << "#{index}"
        end
      end
      computer_move = @valid_moves[rand(@valid_moves.length)]
    end

  end
end
