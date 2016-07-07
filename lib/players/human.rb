require_relative "../player.rb"
module Players
	class Player::Human < Player

		def move(board = nil)
			puts "Where would you like to move? (1-9)"
			input = gets.strip
		end

	end
end