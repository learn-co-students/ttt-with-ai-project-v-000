require "pry"
module Players
  attr_accessor :board, :game, :player
  class Human < Player
    
    def move(board)
      puts "Enter move:"
      user_input = gets.chomp
      user_input
    end
  end
end