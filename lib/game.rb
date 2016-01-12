require_relative 'board.rb'
require_relative 'players/human.rb'
require_relative 'players/computer.rb'
#require_relative 'player.rb'
require 'pry'

class Game
	attr_accessor :board, :player_1, :player_2, :turn_res
	WIN_COMBINATIONS = [
		[0,1,2],
		[0,3,6],
		[0,4,8],
		[1,4,7],
		[2,4,6],
		[3,4,5],
		[6,7,8],
		[2,5,8]
		]
	
	def initialize(player_1=Human.new("X"), player_2=Human.new("O"), board=Board.new)
		@player_1 = player_1
		@player_2 = player_2
		@board = board
	end	
	
	def current_player
		self.board.cells.count("O") == self.board.cells.count("X") ? self.player_1 : self.player_2
	end
	
	def won?
		!WIN_COMBINATIONS.detect { |x| self.board.cells[x[0]] == self.board.cells[x[1]] && self.board.cells[x[0]] == self.board.cells[x[2]] && self.board.cells[x[0]] != " "}.nil?
	end  
	
	def draw?
		self.board.full? && !self.won?
	end
	
	def over?
		self.won? || self.draw?
	end
	
	def winner
		if self.won? && !WIN_COMBINATIONS.detect { |x| self.board.cells[x[0]] == self.board.cells[x[1]] && self.board.cells[x[0]] == self.board.cells[x[2]] && self.board.cells[x[0]] == "X"}.nil?
			return "X"
		elsif self.won?
			return "O"
		else 
			return nil
		end
	end
	
	
	def turn
		self.turn_res = "10"
		until self.board.valid_move?(self.turn_res)
		puts "#{self.current_player.name}:"
		self.board.display
		self.turn_res = self.current_player.move(self.board.cells)
		puts "Invalid move. Try again" if !self.board.valid_move?(self.turn_res)
		end
		self.board.update(self.turn_res,self.current_player)
	end
	
	def play
		while !self.over?
		if self.current_player.class == Human
			self.turn
		else
			self.board.display
			self.turn_res = self.current_player.move(self.board)
			self.board.update(self.turn_res,self.current_player)
		end
		end
		self.board.display
		puts "Congratulations #{self.winner}!" if self.won?
		puts "Cats Game!" if self.draw?
	end
	
end



