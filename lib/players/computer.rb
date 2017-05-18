module Players

	class Computer < Player


		def move(board)
			valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

			if board.cells.all? {|i| i == " "}
				"5"
			else
				#self.last_turn
				valid_moves.sample
			end
		end

		#for AI 
		def last_turn(game)
			opponent_turn = game.moves.last.to_i
			opponent_turn+1.to_s
		end

	
	end



end