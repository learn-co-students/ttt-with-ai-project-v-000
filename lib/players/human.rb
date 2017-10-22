#Players::Human inherits from Player
module Players

	class Human < Player

		#Players::Human #move asks the user for input and returns it
		def move(board)
			puts "Please enter 1-9"
			#strips your string of both leading and trailing whitespaces,
			#be they spaces, tabs, unbreakable spaces, carriage returns or new line characters.
			gets.strip
		end

	end
end