require_relative '../player.rb'

module Players
	class Computer < Player
		def move(board)
			sleep(1)
			if board.needs_block?
				board.block_positions[0]
			elsif !board.taken?("5")
				"5"
			elsif board.which_cornors?
				board.which_cornors?
			else 
				board.available_spots
			end
		end
	end
end