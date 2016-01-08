class Human < Player
	attr_reader :input
	@@invalid_count = 0
	def move(board)
		input = gets
	end
end
