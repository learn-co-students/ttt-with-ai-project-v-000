module Players
	Human < Player

		def move(board)
			puts "PLease enter 1-9:"
			gets.strip
		end
	end
end