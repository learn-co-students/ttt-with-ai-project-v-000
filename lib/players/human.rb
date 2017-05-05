module Players

	class Human < Player

		def move(board)
			puts "Enter number between 1-9: "
			input = gets.chomp
		end

	end

end