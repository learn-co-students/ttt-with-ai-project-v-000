def start_game
	
	puts "Enter '0' for a computer only game, '1' for a one player game, or '2' for a two player game."
	puts "Or, enter 'wargames!' to watch the computer play 10 games with itself."
	game_type = gets.strip
	
	if game_type == "0" then
	  game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O")).play
	elsif game_type == "1" then
	  game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O")).play
	elsif game_type == "2"
	  game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O")).play
	elsif game_type == "wargames!"
		10.times do
			game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O")).play
		end
	elsif game_type == "exit"
		puts "bye bye"
		return
	else
		puts "Please enter 0, 1, 2, or wargames!"
		start_game
	end
	
	puts "Would you like to play again? (Y/N)"
	if gets.strip == "Y"
		start_game
	else
		puts "bye bye"
		return
	end
end