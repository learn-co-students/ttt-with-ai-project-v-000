module Players
  class Computer < Player
    def move (board)
      board.cells.each_with_index do |cell, index|
        if board.valid_move?("#{index+1}")
          return "#{index+1}"
        end
      end
    end
  end
end
