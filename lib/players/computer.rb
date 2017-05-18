require 'pry'

module Players

	class Computer < Player

		attr_accessor :board, :winning_moves

		VALID_MOVES = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

#by exposing winning_moves, once all methods can see it, I can check from anywhere. Write move logic in move. 


		def move(board)
			if board.cells.all? {|i| i == " "}
				"5"
			elsif winning_moves.count == 0
				VALID_MOVES.sample
			elsif win_options?
				ai_move = self.winning_moves[0]+1
				ai_move.to_s
			end
		end

		def winning_moves
			@winning_moves = []
		end


		def win_options?(board)
			Game::WIN_COMBINATIONS.each do |combo|
				if board.cells[combo[0]] == self && board.cells[combo[1]] == self && board.cells[combo[2]] == " "
					winning_moves << board.cells[combo[2]]
				elsif board.cells[combo[1]] == self && board.cells[combo[2]] == self && board.cells[combo[0]] == " "
					winning_moves << board.cells[combo[0]]
				elsif board.cells[combo[0]] == self && board.cells[combo[2]] == self && board.cells[combo[1]] == " "
					winiing_moves << board.cells[combo[1]]
				end
			end
			if self.winning_moves.count >=1
				true
			end
		end



		

	
	end



end