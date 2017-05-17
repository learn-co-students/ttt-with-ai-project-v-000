module Players
	class Human < Player
		def move(board)
			puts "Where do you want to move?"
			 gets.chomp
		end
	end
end
