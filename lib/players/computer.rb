require_relative "../player.rb"

class Player::Computer < Player
	def move(board)
		move = rand(7)+1
		move.to_s
	end
end
