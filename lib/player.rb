class Player
	attr_reader :token, :name

	def initialize(token, name = "player")
		@token = token
		@name = name
	end
end