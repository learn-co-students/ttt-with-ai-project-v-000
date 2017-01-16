require_relative '../player.rb'

module Players
	attr_reader :move

	class Human < Player
		
		
		def move(board, game)
			input = gets.chomp
			input

		end

	end

end