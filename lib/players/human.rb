require_relative '../board.rb'

class Player::Human < Player
	def move(board)
		puts "\nEnter a valid position 1-9 that is not taken: "
		user_input = gets.strip
	end
end