module Players
  class Computer < Player
    attr_accessor :available

    def move(board)
      @available = []
      board.cells.each.with_index do | entry, index |
        if board.valid_move?( index + 1 )
          @available << ( index + 1 ).to_s
        end
      end
      computer_move = @available.sample
    end

  end
end
