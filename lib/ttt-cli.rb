class TttCli

	attr_accessor :player_mode, :choice

	def initialize
		game = Game.new
	end

	def play_game
		puts "Welcome to tic tac toe!"
		puts "Would you like to play 0,1 or 2 player mode?(enter # of players)"
		@player_mode = gets.chomp
		if @player_mode == "0"
			game.ai_fight
			game.play
		elsif @player_mode == "1"
			puts "Would you like to be X or O?(X goes first)"
			@choice = gets.chomp
			game.ai_vs_human(self.choice)
			game.play
		else	
			game.play
		end

	end
end