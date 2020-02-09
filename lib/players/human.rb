module Players
	class Human < Player 
		attr_accessor :game
		def move(board)
			gets.chomp
		end
	end
end