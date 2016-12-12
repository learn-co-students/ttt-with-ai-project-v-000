require_relative '../player.rb'

class Player
	class Human < Player
		def move(board)
			puts "Input 1-9:"
			input = gets.strip
			return input
		end
    end
end
