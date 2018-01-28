module Players
	class Computer < Player

		def move(board)
			position = 1
			while board.taken?(position)
				position += 1
			end
			sleep(5)
			position.to_s
		end

	end
end