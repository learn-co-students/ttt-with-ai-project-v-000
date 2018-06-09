module Players
	class Human < Player

		def move(board)
			puts "Please enter a number between 1 and 9"
			input = gets.chomp
		end

	end
end  