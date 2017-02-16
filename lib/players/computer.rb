module Players
	class Computer < Player
		WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # bottom row
    [0,3,6],  # left column
    [1,4,7],  # Middle column
    [2,5,8],  # right column
    [0,4,8],  # cross left
    [2,4,6]  # cross right
  ]
		def move (board)
			#placeholder to pass tests, will update to automation later
			#rand(1..9)

			if board.cells[4] == " " || empty_board?(board) #if middle is open or if board is empty, take that spot
				"5"
			elsif block_opponent(board) != nil #if opponent is about to win, block it
				block_opponent(board)

			elsif board.cells[4] != " " && corner_open?(board) #if middle is taken & corner still open, occupy corner 0,2,6,8
				play_corner
			
			else	# last resort to play random number	
				rand(1..9)
			end

		end

		def empty_board? (board)
			board.cells.all? {|e| e == " "}
		end

		def play_corner
			corners = [1,3,7,9]
			corners[rand(0..3)]
		end

		def corner_open? (board)
			board.cells[0] == " " || board.cells[2] == " " || board.cells[6] == " " || board.cells[8] == " "
		end

		def need_block? (board, row) #check if blocking is needed in a row/col/diag
			@token == "X"? opponent = "O" : opponent = "X"

			#only return true if two of the positions are occupied by opponent and third position is empty
			#otherwise that means there is no need to block, so return false
			if board.cells[row[0]] == board.cells[row[1]] && board.cells[row[0]] == opponent && board.cells[row[2]] == " "
				true
			elsif board.cells[row[0]] == board.cells[row[2]] && board.cells[row[0]] == opponent && board.cells[row[1]] == " "
				true
			elsif board.cells[row[1]] == board.cells[row[2]] && board.cells[row[1]] == opponent && board.cells[row[0]] == " "
				true
			else
				false
			end
		end

		def block (board, row) 
		#find position that needs blocking 
		#this method is only used if #need_block? returns true
		#so it only needs to find a position that is empty
			position = 10
			row.each {|p| position = p+1 if board.cells[p]== " "}
			position
		end

		def block_opponent (board)
			position = 10
			WIN_COMBINATIONS.each {|r| position = block(board, r) if need_block?(board,r) }
			position == 10? nil : position
		end
	end
end