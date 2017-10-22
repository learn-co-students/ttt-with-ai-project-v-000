#!/usr/bin/env ruby

require_relative '../config/environment'


def game
	answer = ""
	unless answer == "0" || answer == "1" || answer == "2"
			puts "Hello, so you would like to play a game... How many players will there be today? 0,1,2?"
			answer = gets.strip
	end	
	if answer == "1"
		puts "Would you like to be X's or O's, press 1 for X and 2 for O?"
		x_o_answer = gets.strip
	elsif answer == "2"
		puts "Would you like this first player to be X's or O's, press 1 for X and 2 for O?"
		x_o_answer = gets.strip
	end
		
		if answer == "0"
			x = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"))
		elsif answer == "1" && x_o_answer == "1"
			x = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"))
		elsif answer == "1" && x_o_answer == "2"
			x = Game.new(player_1 = Players::Human.new("O"), player_2 = Players::Computer.new("X"))
		elsif answer == "2" && x_o_answer == "1"
			x = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"))
		elsif answer == "2" && x_o_answer == "2"
			x = Game.new(player_1 = Players::Human.new("O"), player_2 = Players::Human.new("X"))
		else 
			x = Game.new()
		end

		x.play 

		puts "Would you like to play again? Y or N?"
		again = gets.strip
		if again == "Y" || again == "y"
			puts "Let's go again"
			return "Y"
		elsif again == "N" || again == "n"
			puts "Thanks for playing!!!\n\n"
			return "N"
		end

end
f = ""
until f == "N"
	f = game
end



