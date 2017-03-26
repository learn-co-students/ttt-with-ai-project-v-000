
# Define the super class for Human and Computer players
# Defines a player and a player's token
class Player

	attr_accessor :player
	attr_reader :token

	def initialize(token)
		@token = token
		@player = player
	end
end
