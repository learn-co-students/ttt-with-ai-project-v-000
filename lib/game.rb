class Game
	attr_accessor :board, :player_1, :player_2
	WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]


	def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
		@board = board
		@player_1 = player_1
		@player_2 = player_2
		
	end

	def current_player
		if self.board.turn_count.odd?
			return self.player_2
		else
			return self.player_1
		end
	end

	def over?
		board.full? || self.won? || self.draw?
	end

	def won?
			a = []
			WIN_COMBINATIONS.each do |i|
				if i.all?{|item| self.board.cells[item] == "X"} || i.all?{|item| self.board.cells[item] == "O"}
				a << i
				end
			end 
			if a == []
				false
			else 
				true
			end 
	end

	def draw?
		self.board.full? && !self.won?
	end

	def winner
		a = board.cells.select{|item| item == "X"}
		b = board.cells.select{|item| item == "O"}
		if self.won?
			if a.length > b.length
				return "X"
		    else
			    return "O"
			end
		else
			nil
		end
	end

	def turn
	if current_player == player_1
		puts "Player X, please make your move."
	else
		puts "Player O, please make your move."
	end
		position = self.current_player.move(self.board)
		if board.valid_move?(position) == true
			self.board.update(position, current_player)
		else
			i = 0
				until board.valid_move?(position) == true do
				puts "This move is not valid. Please try again."
				position = self.current_player.move(self.board)
				i += 1
				end
			self.board.update(position, current_player)
		end	
	end

	def play
		puts "Welcome to Tic Tac Toe!"
		i = 0
		until self.over? do
			self.turn
			self.board.display
			i+=1
		end
		if self.draw? 
			puts "Cats Game!"
		elsif won? && winner == "X"
			puts "Congratulations X!"
		else
			puts "Congratulations O!"
		end
	end

end
