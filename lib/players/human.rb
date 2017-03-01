
# Human sub-class of Player
class Players::Human < Player

	# Accepts input from the player for their turn of the game
	def move(input)
		input = gets.strip
	end
end
