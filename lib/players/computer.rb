require 'pry'

module Players
	class Computer < Player

		def move(board = nil, game = nil)
	    input = rand(1..9).to_s
	    input
		end

	end
	# binding.pry

end

#rspec spec/05_computer_player_spec.rb