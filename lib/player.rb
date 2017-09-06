module Players
end

	class Player
		attr_reader :token

		def initialize(token) 
			@token = token
		end
	end


class Players::Human < Player

	def move(input)
		puts "Input a cell"
		input = gets.strip
	end

	
end
