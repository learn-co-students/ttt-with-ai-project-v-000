module Players
	class Human < Player

		def move(board)
      	token = self.token
      		puts "Your move, #{token}. Please enter 1-9:"
      	input = gets.strip
    	end
	end
end