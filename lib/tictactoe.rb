class TicTacToeCLI
	def initialize
	end

  def input_validation(input,valid_array)
    while !valid_array.include?(input)
    	print "\nInvalid input. Try again. "
    	input = gets.chomp
    end
    input
  end

	def call

		# Keep starting new games until player exits.
		exit = false
		while !exit
			puts 'Welcome to our Tic Tac Toe.'

			# User chooses human players, computer players, or one of each.
			print 'How many human players? (0,1,2): '
			humans = input_validation(gets.chomp, ['0','1','2'])
			puts "\n\nO.K. Playing with #{humans} human player#{humans == '1' ? '' : 's'}."

			# If one of each, user chooses who goes first.
			if humans == '1'
				print 'Who goes first, computer or human? '
				first = input_validation(gets.chomp, ['computer','human'])

				# Computer plays first.
				if first == "computer"
					player_1 = Players::Computer.new("X")
					player_2 = Players::Human.new("O")

				# Human plays first.
				else
					player_1 = Players::Human.new("X")
					player_2 = Players::Computer.new("O")
				end
				puts "\nO.K. The #{first} opens play."

			# Two computer players
			elsif humans == '0'
				player_1 = Players::Computer.new("X")
				player_2 = Players::Computer.new("O")

		  # Two human players
			elsif humans == '2'
				player_1 = Players::Human.new("X")
				player_2 = Players::Human.new("O")
			end

			# Players are set. Create new game and launch play.
			game = Game.new(player_1,player_2)
			game.play

			# User chooses to set up new game or exit
			print "\nWould you like to play a new game? (y,n) "
			repeat = input_validation(gets.chomp, ['y','n'])
			exit = repeat.downcase == "y" ? false : true
		end

		puts "\nThank you for playing!"	
	end
end