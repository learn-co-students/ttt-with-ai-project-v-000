require_relative '../player.rb'

module Players
	class Computer < Player
		def move(board, game)
			
			if board.needs_block?
				if board.answer_token.include?(game.current_player.token)
					index = board.answer_token.index(game.current_player.token)
					board.block_positions[index]
				else
					board.block_positions[0]
				end

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