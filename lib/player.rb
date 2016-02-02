class Player
	attr_reader :token, :game

	def initialize(token)
		@token = token
	end

	def game(game)
		@game = game
	end

end
