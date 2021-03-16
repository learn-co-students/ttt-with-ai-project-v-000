require 'pry'
module Players
  class Human < Player 
    def move(board)
      puts "Select a number 1-9."
      pos = gets.chomp
      @@board_pos.delete(pos)
      pos
    end
  end
end