require 'pry'
require_relative "../player.rb"

module Players

  class Human < Player

    def move(board)
      puts "Where do you want to move?"
      gets.strip
    end
  end

end
