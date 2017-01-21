class TicTacToeCLI
	def initialize
	end

	def call
		play_again = nil
		while play_again != "N"
			num_players = nil
			puts "Welcome to Tic Tac Toe! "
			choices = ["0", "1", "2", "WARGAMES"]

			while !choices.include?(num_players)
				print "How many players? (0, 1, 2, wargames): "
				num_players = gets.strip.upcase
			end

			if num_players.to_i == 0 || num_players == "WARGAMES"
				player_1 = Players::Computer.new("X")
				player_2 = Players::Computer.new("O")
			elsif num_players.to_i == 1
				my_token = nil
				while my_token != "X" && my_token != "O"
					print "You will be playing against the computer. Which Token would you like? (X/O): "
					my_token = gets.chomp.upcase
				end
				
				computer_token = my_token == "X" ? "O" : "X"
				player_1 = Players::Human.new(my_token)
				player_2 = Players::Computer.new(computer_token)
			elsif num_players.to_i == 2
				print "You will be playing against a friend. "
				player_1 = Players::Human.new("X")
				player_2 = Players::Human.new("O")
			end

			if num_players == "WARGAMES"
				Game.wins = 0
				Game.draws = 0
				100.times do 
					game = Game.new(player_1, player_2)
					game.play
				end
				puts "Wins: #{Game.wins}"
				puts "Draws: #{Game.draws}"
				play_again = nil
				while play_again != "Y" && play_again != "N"
				print "Play again? (y/n) "
				play_again = gets.strip.upcase
			end
			else
				who_goes_first = nil
				while who_goes_first != "X" && who_goes_first != "O"
					print "Who should go first? (X/O): "
					who_goes_first = gets.chomp.upcase
				end

				if player_1.token == who_goes_first
					game = Game.new(player_1, player_2)
				else
					game = Game.new(player_2, player_1)
				end
				game.play
				play_again = nil
				while play_again != "Y" && play_again != "N"
				print "Play again? (y/n) "
				play_again = gets.strip.upcase
				
				end
			end
		end
	end
end