# require_relative "../player.rb"

class Human < Player
	def move(board)
		if board.class != Board
			if board.length == nil || board.length.even?
				player = "X"
			else
				player = "O"
			end
		else
			board.turn_count.even? ? player = "X" : player = "O"
		end
		return [(print "Player #{player}, please make your move: "), gets.rstrip][1]
	end
end