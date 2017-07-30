module Players

	class Computer < Player # computer methods 

		attr_accessor :board

		WIN_COMBINATIONS = [
		  	[0,1,2],
		  	[3,4,5],
		  	[6,7,8],
		  	[0,3,6],
		  	[1,4,7],
		  	[2,5,8],
		  	[0,4,8],
		  	[2,4,6]
		]

		def move(board)  
			puts "Now the computer's move..."
			self.board = board
			valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
			first_move = "5"
			@move = nil

			if board.valid_move?(first_move)
				@move = first_move
			elsif !next_move.empty?
				next_move.sample
			elsif !remaining_moves.empty?
				remaining_moves.sample
			end
		end


		def next_move
			corners = [1, 3, 7, 9]

			corners.select do |corner|
				!self.board.taken?((corner))
			end

		end

		def remaining_moves
			leftovers = [2, 4, 6, 8]

			leftovers.select do |leftover|
				!self.board.taken?((leftover))
			end

		end

	end 

end

