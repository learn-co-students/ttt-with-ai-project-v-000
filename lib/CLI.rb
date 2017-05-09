class CLI

	def start
		game_type = ""
		until game_type =~ /0|1|2/
			puts "\nWhat kind of game would you like to play?"
			puts " -- Enter 0 for Computer vs Computer"
			puts " -- Enter 1 for Human vs Computer"
			puts " -- Enter 2 for Human vs Human"
			print "\nGame Type: "
			game_type = gets.chomp
			puts
		end

		case game_type
			when "0"
				player_1 = Players::Computer.new("X")
				player_2 = Players::Computer.new("O")
				game_setup(player_1, player_2)
			when "1"
				print "Who goes first? [1 = Human | 2 = Computer]: "
				player = gets.chomp
				puts

				if player == "1"
					player_1 = Players::Human.new("X")
					player_2 = Players::Computer.new("O")
				else
					player_1 = Players::Computer.new("X")
					player_2 = Players::Human.new("O")
				end
				game_setup(player_1, player_2)
			when "2"
				game_setup
		end
	end

	def game_setup(player_1 = nil, player_2 = nil)
		game = Game.new(player_1, player_2)
		game.board.display_start
		puts
		game.play
		play_again if game.over?
	end

	def play_again
		input = ""
		until input =~ /y|n/i
			print "\nWould you like to play again? [y/n]: "
			input = gets.chomp
		end

		input == "y" ? start : exit
	end

end