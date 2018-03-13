require 'pry'
module Players
  class Human < Player
    def move(board=nil)
      if board.turn_count == 0
        puts " 1 | 2 | 3 "
        puts "-----------"
        puts " 4 | 5 | 6 "
        puts "-----------"
        puts " 7 | 8 | 9 "
      end
      puts "Please enter a board position to play (1-9): "
      input = gets.strip
    end
  end
end