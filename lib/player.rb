class Player

	attr_reader :token

	#accepts a token to assign
	#cannot be changed once assigned in initialize
	def initialize(token = "X")
		@token = token
	end
end

