module Players
  class Computer < Player

    def move(board)
      puts "Please enter 1-9:"
      if board.cells[0] == " "
        1
      else m = board.cells.find{|x| x == " "}
      "#{board.cells.index(m)+1}"
    end
    end
  end
end
