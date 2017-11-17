
module Players
  class Computer < Player

    def move(board)
      puts "Where would you like to move?"
      move = [5, 1, 3, 7, 9, 2, 4, 6, 8].find {|m|!board.taken?(m)}.to_s
    end
  end
end
