class Player

	attr_reader :token

	def initialize(token)
		@token = token
	end

end

#rspec spec/02_player_spec.rb