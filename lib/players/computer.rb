module Players
	class Computer < Player

		# Rule 1: If I have a winning move, take it.
		# Rule 2: If the opponent has a winning move, block it.
		# Rule 3: If I can create a fork (two winning ways) after this move, do it.
		# Rule 4: Do not let the opponent creating a fork after my move. (Opponent may block your winning move and create a fork.)
		# Rule 5: Place in the position such as I may win in the most number of possible ways.

		WIN_COMBINATIONS = [
	    [0,1,2],[3,4,5],[6,7,8],
	    [0,3,6],[1,4,7],[2,5,8],
	    [0,4,8],[2,4,6]]

	  FORK_COMBINATIONS = [
	  	[0,2,6],[0,2,8],[0,6,8],[2,6,8],
	  	[2,4,8],[0,4,6],[0,4,2],[6,4,8],
	  	[0,1,3],[1,5,2],[5,7,8],[6,3,7],
	  	[0,3,5],[0,4,8],[3,4,6]]

		def move(board)
			opponent ='O' if self.token=='X'
			opponent ='X' if self.token=='O'

			if winning_move?(board,self.token)
				array = winning_move?(board,self.token)
				index = array.detect{|x| board.cells[x]==" "} +1
				index.to_s
			elsif winning_move?(board,opponent)
				array = winning_move?(board,opponent)
				index = array.detect{|x| board.cells[x]==" "} +1
				index.to_s
			elsif fork?(board,self.token)
				array = fork?(board,self.token)
				index = array.detect{|x| board.cells[x]==" "} +1
				index.to_s
			elsif fork?(board,opponent)
				array = fork?(board,opponent)
				index = array.detect{|x| board.cells[x]==" "} +1
				index.to_s
			elsif board.turn_count <= 3
				index = first_moves(board) +1
				index.to_s
			else
				index = board.cells.index(' ')+1
				index.to_s
			end
		end

		def winning_move?(board,player)
			WIN_COMBINATIONS.detect do |array|
				(board.cells[array[0]] == player && board.cells[array[1]] == player && board.cells[array[2]] == " ") ||
				(board.cells[array[0]] == player && board.cells[array[1]] == " " && board.cells[array[2]] == player) ||
				(board.cells[array[0]] == " " && board.cells[array[1]] == player && board.cells[array[2]] == player)
    	end
		end

		def fork?(board,player)
			FORK_COMBINATIONS.detect do |array|
				(board.cells[array[0]] == player && board.cells[array[1]] == player && board.cells[array[2]] == " ") ||
				(board.cells[array[0]] == player && board.cells[array[1]] == " " && board.cells[array[2]] == player) ||
				(board.cells[array[0]] == " " && board.cells[array[1]] == player && board.cells[array[2]] == player)
    	end
		end

		def first_moves(board)
			idx = board.cells.index(self.token)
			if idx == 8
				return 0 if board.cells[0] == ' '
			elsif idx ==0
				return 8 if board.cells[8] == ' '
			elsif idx ==2
				return 6 if board.cells[6] == ' '
			elsif idx == 6
				return 2 if board.cells[2] == ' '
			end

			if board.turn_count == 0
				[0,2,6,8].shuffle!.detect{|x| board.cells[x] == ' '}
			else
				a = [4,0,2,6,8]
				a.shuffle! if self.token == 'X'
				a.detect{|x| board.cells[x]==' '}
			end
		end

	end
end
