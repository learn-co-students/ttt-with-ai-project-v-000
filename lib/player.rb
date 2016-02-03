class Player
	attr_accessor :game
	attr_reader :token

	def initialize(token)
		@token = token
	end

	def game(game)
		@game = game
	end

end
