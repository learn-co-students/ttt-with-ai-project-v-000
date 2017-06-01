module Players
  class Computer < Player

  	def move(board)
  		input = "1"
  		until board.valid_move?(input)
  			input = (input.to_i + 1).to_s
  		end
  		input.to_s
  	end

  end
end