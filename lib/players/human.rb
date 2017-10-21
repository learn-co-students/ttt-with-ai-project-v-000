class Player::Human < Player

	def move(position)
	  puts "Choose a position from 1-9"
	  position = gets.chomp
	  position
	end

end