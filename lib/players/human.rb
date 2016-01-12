class Player::Human < Player
	def move(board)
		puts "Where do you want to move? "
		user_input = gets.strip

		until user_input.to_i.between?(1, 9)
			puts "Please enter a valid position (1-9): "
			user_input = gets.strip
		end

		user_input
	end
end