module Players
  class Computer < Player

    def move(board)
      valid_indeces = []
      corners = [1,3,9,7]
      board.cells.each_with_index do |cell, index|
        if cell == " "
          valid_indeces << index + 1
        end
      end
      if valid_indeces.include?(5)
        5.to_s
      elsif valid_indeces.include?(corners)

      else
        valid_indeces.sample.to_s
      end

    end
  end
end
