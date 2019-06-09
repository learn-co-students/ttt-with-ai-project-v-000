require './config/environment.rb'
module Players
  class Human < Player
  
    def move(board)
      puts "Where would you like to move?"
      move = gets.chomp
      move
    end
  
  end
end