module Players
  class Computer < Player

    def move(board)
      board.display
      _, index = board.cells.each_with_index.detect {|x,i| x != "X" && x != "O"  }
      puts "Computer #{self.token} selected position #{index + 1}." 
      (index + 1).to_s
    end
  end
end