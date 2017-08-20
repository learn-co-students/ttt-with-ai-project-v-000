class Player
  attr_accessor :board, :game #just added
  attr_reader :token
  
	def initialize(token)
		@token = token
	end
end