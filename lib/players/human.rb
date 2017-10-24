require_relative '../player.rb'

module Players
	attr_reader :move

	class Human < Player	
		def move(board, game=Game.new)
			gets.chomp
		end
	end
end