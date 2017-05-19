require 'pry'

module Players

	class Computer < Player

		attr_accessor :board 

		VALID_MOVES = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

		def move(board)
			if board.cells.all? {|i| i == " "}
				"5"
				#if #win_options returns an array with at least one possible move, player moves to that space
			elsif win_options(board).count >=1
				ai_move = win_options(board)[0]+1
				ai_move.to_s
				#if #win_options returns an empty array, make a random move based on valid moves
			elsif win_options(board).count == 0
				VALID_MOVES.sample
			end
		end

		def win_options(board)
			winning_moves = []
			#If 2/3 cells in a given combo are occupied by player and 3rd cell is empty, add cell to array of winning moves
			Game::WIN_COMBINATIONS.each do |combo|
				if board.cells[combo[0]] == self.token.to_s && board.cells[combo[1]] == self.token.to_s && board.cells[combo[2]] == " "
					winning_moves << combo[2]
				elsif board.cells[combo[1]] == self.token.to_s && board.cells[combo[2]] == self.token.to_s && board.cells[combo[0]] == " "
					winning_moves << combo[0]
				elsif board.cells[combo[0]] == self.token.to_s && board.cells[combo[2]] == self.token.to_s && board.cells[combo[1]] == " "
					winning_moves << combo[1]
				end
			end
			#returns array 
			winning_moves
		end

	end

end