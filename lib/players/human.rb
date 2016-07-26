module Players

	class Human < Player

		def move(place)
			puts "Make a Move!"
			move = gets.chomp
			return move
		end



	end







end