module Players

  class Computer < Player
    
    def move(board)
      available_moves = []
      board.cells.each do |cell|
        if cell === " "
          available_moves.push(cell)
        end
      end
      random_integer = 1 + rand(available_moves.length - 1)
      random_integer.to_s
    end
    
  end
  
end