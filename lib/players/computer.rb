module Players
  class Computer < Player
    def move (input)
      Board.cells.each_with_index do |cell, index|
        if Board.valid_move("#{index+1}")
          return "#{index+1}"
        end
      end
    end
  end
end
