def tictactoe
	puts "This Tic-Tac-Toe game works by entering a number for spaces 1-9."
	puts "So our board looks like this:"
	puts " 1 | 2 | 3 "
	puts "-----------"
	puts " 4 | 5 | 6 "
	puts "-----------"
	puts " 7 | 8 | 9 "
loop do
	puts "How many players will be playing?"
	puts "Enter zero for Computer vs. Computer."
	puts "Enter one for Computer vs. Human."
	puts "Enter two players to play with a human friend!"
	response = gets.strip.downcase

		case response
		when "zero", "0"
			game = Game.new(Player::Computer.new("X"), Player::Computer.new("O"), Board.new)
		when "one", "1"
			game = Game.new(Player::Computer.new("X"), Player::Human.new("O"), Board.new)
		when "two", "2"
			game = Game.new(Player::Human.new("X"), Player::Human.new("O"), Board.new)
		when response != "exit"
			puts "Hmmm... I don't understand. Enter 0, 1 or 2."
			tictactoe
		else
			puts "Thanks for playing!"
			break
		end
	until game.won? || game.draw?
	game.play
	end
	end
end