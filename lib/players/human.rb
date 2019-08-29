module Players
	class Human < Player

		def move(board = nil)
			input = nil
			while !input.to_i.between?(1, 9)
				board.display
				puts "Pick a square: 1-9"
				input = gets.strip
			end
			input
		end
	end
end
