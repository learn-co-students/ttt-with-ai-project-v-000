module Players
  class Computer < Player

    def move(board)
    	input = ""
    	until board.valid_move?(input)
      		input = (1..9).to_a.sample
      	end
      	input.to_s
    end

  end

end
