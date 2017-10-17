module Players

	class Human < Player

		attr_accessor :board

		def move(x = nil)
			puts "Please select move (1-9): "
			input = gets.strip


			#171016: I have no idea what this is about. It passes but makes no sense.
			#Why is this asking for an argument, but then not
			#using it.
			#Related: why does the test call for this method to have an argument equal to an empty array?  This is why i made the argument optional with "= nil"
		end

	end

end
