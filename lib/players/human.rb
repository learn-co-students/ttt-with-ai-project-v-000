module Players
	class Players::Human < Player

		def move(board)
			print "Your move. Choose an empty cell (1-9): "
			input = gets.chomp
		end

	end
end