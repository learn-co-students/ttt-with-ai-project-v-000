class Player::Human < Player

	def move(position)
	  position = gets.chomp
	  position.to_s
	end

end