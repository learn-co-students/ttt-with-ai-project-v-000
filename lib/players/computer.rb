module Players
  class Computer < Player
    def move(board)
      options = []
      board.cells.each_with_index do |spot, index|
        if spot == " "
          options << index.to_i + 1
        end
      end
      options.sample.to_s
    end
  end
  
end
