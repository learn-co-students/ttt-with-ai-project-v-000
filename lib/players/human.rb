module Players
	class Human < Player # h inherits from player, is this right?

		def move(board)
			puts "Where would you like to move?"
			input = gets.chomp

			#allows human player to enter a move via the CLI
			# returns: value entered by the hyuman dplayer
			# doesn't have to use the board argument.


		end
	end

end
#player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O")
