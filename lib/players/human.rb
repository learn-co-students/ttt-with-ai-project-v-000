class Human < Player

	def move(*board)
		#asks the user for input and return it
		puts "What position would you like to take?"
		gets.strip
	end
end
