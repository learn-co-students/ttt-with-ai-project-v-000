module Players
  class Computer < Player
    attr_reader :game, :board
    def move(board)
      if board.cells[3] == " "
        4.to_s
      else
        rand(1..9).to_s
    end
    end
  end
end 
