class Player

	attr_reader :token


	def initialize(token)
		@token = token
	end

	private

	def token=(token)
		@token = token
	end

end 
