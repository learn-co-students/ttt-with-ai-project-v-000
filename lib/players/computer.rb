module Players

  class Computer < Player

    def move(board)
      puts "Computer is thinking..."
      sleep(2)
      i = board.cells.find_index {|cell| cell == " "}
      (i + 1).to_s
    end
  end
end
