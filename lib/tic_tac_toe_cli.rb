class TicTacToeCLI


	def call
		puts "Hello there, game master."
		sleep 1
		puts "How many players today - 0, 1, or 2?"
		input = gets.strip
		if input.to_i == 0

			Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O")).play
		elsif input.to_i == 2
			Game.new.play
		else input.to_i == 1
			puts "Will you play X or O?"
			first = gets.strip

			if first == "X"
				Game.new(player_1=Players::Human.new("X"), player_2=Players::Computer.new("O")).play
			else
				Game.new(player_1=Players::Computer.new("X"), player_2=Players::Human.new("O")).play
			end
		end
	end



end
