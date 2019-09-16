module Players
	class Human < Player

		def move(board)
			puts "Your move #{@token}, what's your play?"
			input = gets.chomp
		end

	end
end