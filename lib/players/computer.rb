module Players
	class Computer < Player
		attr_accessor :board
		def move(board)
			@board = board
      prng = Random.new
			input = prng.rand(1..9)
      input = input.to_s
		end
	end
end
