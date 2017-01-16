require_relative './player.rb'
require_relative './board.rb'

class Game
	attr_accessor :board, :player_1, :player_2, :current_player

	WIN_COMBINATIONS = [
	[0, 1, 2],
	[3, 4, 5],
	[6, 7, 8],
	[0, 3, 6],
	[1, 4, 7],
	[2, 5, 8],
	[0, 4, 8],
	[2, 4, 6]
	]

	@@wins = 0
	@@draws = 0
	def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
		@player_1 = player_1
		@player_2 = player_2
		@board = board
		@current_player = player_1
		@winning_symbol
	end

	def over? 
		self.won? || self.draw? ? true : false
	end

	def won?
		WIN_COMBINATIONS.each do |combo|
			board = self.board.cells
			if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" ||
			   board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
			   @winning_symbol = board[combo[0]]
			   return true
			end
		end
		false
	end

	def draw?
		!self.board.cells.include?(" ") && !self.won? ? true : false
	end

	def winner
		if self.won?
			@winning_symbol
		else
			nil
		end
	end

	def turn
		input = nil
		self.board.display
		while !self.board.valid_move?(input)
			print "Player \"#{self.current_player.token}\""
			print " (#{self.current_player.class.to_s.gsub("Players::", "")})"

			print " Enter a position: "
			input = self.current_player.move(self.board, self)
		end
		self.board.update(input, self.current_player)
		self.current_player = (self.current_player == @player_1) ? @player_2 : @player_1
		

	end

	def play
		input = nil
		while !self.over?
			self.turn
		end
		self.board.display
		if self.draw?
			@@draws += 1
			puts "Cat's Game!"
		else
			@@wins += 1
		   	puts "Congratulations #{self.winner}!"
		end 
	end

	def self.wins
		@@wins
	end

	def self.wins=(wins)
		@@wins = wins
	end

	def self.draws
		@@draws
	end

	def self.draws=(draws)
		@@draws = draws
	end

end