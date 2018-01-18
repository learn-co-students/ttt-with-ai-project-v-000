module Players
	class Human < Player

		def move(board)
			puts "What's your move big boy?"
			input = gets.chomp
		end

	end
end