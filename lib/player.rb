class Player
#Player #token cannot be changed once assigned in initialize
	attr_reader :token

# Player #initialize accepts a token to assign
	def initialize(token)
		@token = token	
	end

end
