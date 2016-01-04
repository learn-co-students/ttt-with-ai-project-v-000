require_relative "../player.rb"

class Player::Human < Player
	def move(board)
		puts "Enter a move"
		gets.strip
	end
end
