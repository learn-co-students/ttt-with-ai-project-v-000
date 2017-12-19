module Players
  class Computer < Player
    def move(board)
      if board.cells[4] == " "
        "5"                   #middle spot
      else
        "#{[1,3,7,9].sample}" #corners
      end
    end
  end
end
