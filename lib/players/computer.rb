require_relative '../player.rb'

module Players
	class Computer < Player
		def move(board, game)
			corners1 = [board.cells[0], board.cells[8]]
			corners2 = [board.cells[2], board.cells[6]]
			opponent_token = game.current_player.token == "X" ? "O" : "X"
			
			if board.turn_count == 3 && (corners1 == [opponent_token, opponent_token] || corners1 == [opponent_token, opponent_token]) && board.cells[4] != " "
				["2", "4", "6", "8"].sample
			elsif board.needs_block?
				board.block_positions
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