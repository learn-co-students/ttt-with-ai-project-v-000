class Player
	attr_reader :token
	def initialize(token)
		@token = token
	end
	def opponent_token
		if self.token == "X"
			return "O"
		else 
			return "X"
		end
	end


end