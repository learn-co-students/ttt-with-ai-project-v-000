
module Players
	class Human < Player
		def move(board)
			puts "Please enter move"
			gets.strip
		end
	end
end
