require 'pry'

class Game
	attr_accessor :board, :player_1, :player_2

	WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

	def board
		@board
	end

	def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
		@player_1 = player_1
		@player_2 = player_2
		@board = board
	end

	def current_player
		self.board.turn_count.even? ? @player_1 : @player_2
	end

	def over?
		draw? || won?
	end

	def won?
		WIN_COMBINATIONS.find do |combo|
			self.board.cells[combo[0]] == self.board.cells[combo[1]] &&
			self.board.cells[combo[1]] == self.board.cells[combo[2]] &&
			self.board.taken?(combo[0] + 1)
		end
	end

	def draw?
		!won? && self.board.full?
	end

	def winner
		if com = won?
			self.board.cells[com[0]]
		end
	end

	def turn
		puts "#{current_player.token}, please enter 1-9"
        input = self.current_player.move(self.board)
        if board.valid_move?(input)
           board.update(input, self.current_player)
           board.display
        else
      	   board.display
      	   turn
    	 end
    end

	def play
		while !over?
			turn
		end
		won? ? (puts "Congratulations #{winner}!") : (puts "Cat's Game!")
	end

end
