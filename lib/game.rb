class Game

attr_accessor :board, :player_1, :player_2, :cells

	WIN_COMBINATIONS = []
	#defines all the win combos to win the game.

	def initialize
		@player_1 = player_1
		@player_2 = player_2
		@board = board
		board = []
	end

	def current_player
		#returns current player
		
	end

	def over?
		#returns true for a draw, for a won game
		#returns false for a game in progress
	end

	def won?
		#returns false for a game in progress
		#returns true for a won game
	end

	def draw?
		#returns true for a draw
		#returns false for a game in progress, or a win
		
	end

	def self.winner
		#returns X or O for each winner
		#and returns nil for a draw
	end

	def self.turn
		#makes valid moves, asks for input for non-valid moves and changes to player 2 after first move
	end

	def self.play
		#asks for a players input on a turn
		#checks if the game is over after each turn
		#checks if a game is won after each turn
		#checks if a game is a draw after each turn
		#stops playing when someone has won the game
		#prints "Cat's Game" in the event of a draw
		#congradulates the winner, either X or O
		#And, uh, plays through a whole game of course
		
	end
end