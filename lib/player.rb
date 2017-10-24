class Player

	attr_reader :token
	attr_accessor :name

	def initialize(token)
		@token = token
	end

	def token
		@token
	end
end