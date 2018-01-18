class GameCLI

	def call

		puts "Welcome to the invincible Tic Tac Toe!"

	# 1. Prompt the user for what kind of game they want to play, 0,1, or 2 player.
		number_of_players = 3

		until (0..2).include?(number_of_players.to_i)
			puts "How many players (0, 1, 2 players)?"
			number_of_players = gets.chomp
		end

	# 2. Use the input to correctly initialize a Game with the appropriate player types and token values.
		case number_of_players.to_i

			# thats a 2 AI battle
			when 0 
				player_1, player_2 = Players::Computer.new("X"), Players::Computer.new("O")
				puts "You chose a full AI game, sit back and enjoy the fAIt."

			# only one player against AI
			when 1 
				first_player = " "

				# Ask the user for who should go first and be "X"
				puts "Who should play first and be X?"
				until first_player == "me" || first_player == "computer"
					puts "Type 'me' for yourself"
					puts "Type 'computer' for the computer to starts"
					first_player = gets.chomp
				end

				if first_player == "me"
					player_1 = Players::Human.new("X")
					player_2 = Players::Computer.new("O")
					puts "You are X, the computer is O"
				elsif first_player == "computer"
					player_1 = Players::Computer.new("X")
					player_2 = Players::Human.new("O")
					puts "You are O, the computer is X"
				end		

			# 2 human players
			when 2
				player_1 = Players::Human.new("X")
				player_2 = Players::Human.new("X")
				puts "Ready to rock"

		end		# end of case
				
	# 3. Start Game with selected players
		input = ""

		until input == "start" or input == 'exit'
			puts "Enter 'start' to start."
			puts "Enter 'exit' to exit."
			input = gets.strip

			# start the game
			if input == "start"
				puts "Game starts!"
				Game.new(player_1, player_2).play

			# quit the game
			elsif input == "exit"
				puts "Are you sure to exit?"
				puts "Type 'yes' to confirm"
				input = gets.strip

				if input == "yes"
					puts "Bye!"
					return
				end

			end
		end  # end of until
		

	# 4. When the game is over, the CLI should prompt the user 
	# if they would like to play again and allow them to choose a new configuration for the game as described above. 
	# If the user doesn't want to play again, exit the program.

		again = " "
		puts "Ready to play again?"

		until again == "yes" || again == "no"
			puts "Enter 'yes' or 'no'"
			again = gets.strip
		end

		case again
			when "yes"
				call  # recursive call to restart
			when 'no'
				puts "Good Bye and come back soon XOXO!"
				return
		end		
			
	end  # end of #call
end