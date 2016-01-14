class Game
	attr_accessor :board, :player_1, :player_2

	WIN_COMBINATIONS = [[0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]]

	def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
		@player_1 = player_1
		@player_2 = player_2
		@board = board
	end

	def current_player
		self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
	end

	def winner
		x_array = self.board.cells.map.with_index {|cell,i| i if cell == "X"}
		o_array = self.board.cells.map.with_index {|cell,i| i if cell == "O"}
		WIN_COMBINATIONS.each do |combination|
			return "X" if combination.all? {|num| x_array.include?(num)}
			return "O" if combination.all? {|num| o_array.include?(num)}
		end
		nil
	end

	def won?
		if self.winner == "X" || self.winner == "O"
			true
		else 
			false
		end

	end

	def draw?
		if self.board.turn_count == 9 && !self.won?
			true
		else
			false
		end
	end

	def over?
		self.draw? || self.won? ? true: false
	end

	def turn
		puts "#{self.current_player} please enter your move:"
		input = self.current_player.move(self.board)
		self.turn if !self.board.valid_move?(input)
		self.board.update(input, self.current_player)
	end

	def play
		while !self.over?
			self.turn 
		end
		puts "Cats Game!" if self.draw?
		puts "Congratulations #{self.winner}!" if self.won?
	end

end

