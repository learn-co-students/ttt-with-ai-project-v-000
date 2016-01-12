class Player::Human < Player
	def move(board)
		puts "Where do you want to move? "
		user_input = gets.strip

		# get valid_move? from board.rb
		until board.valid_move?(user_input)
			puts "Please enter a valid position (1-9): "
			user_input = gets.strip
		end

		user_input
	end
end