require_relative '../../config/environment.rb'
module Players

  class Human < Player
    def move(board)
      puts "Enter a number from 1-9:"
      input = gets.strip
    end
  end

end #end of module
