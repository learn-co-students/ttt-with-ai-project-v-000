class CommandLineInterface
	
	def run
		puts "Welcome to tic tac toe!"
	    @play = "YES"
	    Game.new.start while @play == "YES"
		play_again? until @play == "YES" || @play == "NO"
		puts "Thanks for playing!"
 	end

 	def play_again?
 		puts "Would you like to play again? Please type yes or no"
 		@play = gets.upcase
 	end

end