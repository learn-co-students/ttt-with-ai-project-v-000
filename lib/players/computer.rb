module Players
	class Computer < Player

		WIN_COMBINATIONS = [
	    [0,1,2],[3,4,5],[6,7,8],
	    [0,3,6],[1,4,7],[2,5,8],
	    [0,4,8],[2,4,6]]

		# def move(board)
		# 	index = board.cells.index(' ')+1
		# 	index.to_s
		# end

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
			else
				index = board.cells.index(' ') +1
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

	end
end
