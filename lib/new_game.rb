def new_game
	puts "How many players do you have? (0 / 1 / 2)"
	number_players = gets.strip

	case number_players
	when "0"
		game = Game.new(Player::Computer.new("X"), Player::Computer.new("O"), Board.new)
		game.play
	when "1"
		puts "Do you want to go first or second? "
		player = gets.strip
		if player == "first" || player == "1"
			puts "You are X."
			game = Game.new(Player::Human.new("X"), Player::Computer.new("O"), Board.new)
			game.play
		elsif player == "second" || player == "2"
			puts "You are O."
			game = Game.new(Player::Computer.new("X"), Player::Human.new("O"), Board.new)
			game.play	
		end
	when "2"
		game = Game.new(Player::Human.new("X"), Player::Human.new("O"), Board.new)
		game.play
	end
end