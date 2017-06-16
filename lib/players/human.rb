require_relative '../player.rb'

module Players
  class Human < Player

    def move(board) #what is this var??
      puts "Please enter 1-9:"
      gets.strip
    end

  end
end
