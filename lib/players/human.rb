#require_relative '../player.rb'

module Players
  class Human < Player
    attr_reader :board
    def move(board)
      print "Please enter 1-9: "
      input = gets.strip
      #binding.pry
      input
    end
  end
end

#human = Players::Human.new("X")
#human.move
