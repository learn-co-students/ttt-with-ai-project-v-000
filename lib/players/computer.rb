class Player::Computer < Player

	def move(*board)
		#asks the computer for input and return it
		prng = Random.new
		prng.rand(1..9).to_s
		
	end
end