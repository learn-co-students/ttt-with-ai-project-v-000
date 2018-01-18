class Game

	attr_accessor :board, :player_1, :player_2

	def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"))
		@board = Board.new
		@player_1 = player_1
		@player_2 = player_2
		@player_1.board = self.board
		@player_2.board = self.board
	end

	WIN_COMBINATIONS= [
		  [0,1,2],
		  [3,4,5],
		  [6,7,8],
		  [0,3,6],
		  [1,4,7],
		  [2,5,8],
		  [6,4,2],
		  [0,4,8]
		]

	def current_player
  		if self.board.turn_count % 2 == 0
    		current_player = self.player_1
  		else current_player = self.player_2
		end
	end

	def draw?
  		won_answer = self.won?
  		full_answer = self.board.full?
  		won_answer == false && full_answer == true
	end


	def over?
  		self.draw? == true || self.won? != false
	end

	def won?
		WIN_COMBINATIONS.each do |win_combination|
			win_index_1 = win_combination[0]
			win_index_2 = win_combination[1]
			win_index_3 = win_combination[2]
			position_1 = self.board.cells[win_index_1]
			position_2 = self.board.cells[win_index_2]
			position_3 = self.board.cells[win_index_3]
			if position_1 == "X" && position_2 == "X" && position_3 == "X"
			  return win_combination
			elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
			  return win_combination
			end
			end
		return false
	end

	def winner
	  if self.won? != false
	    win_combo = self.won?
	    self.board.cells[win_combo[0]]
	  end
	end

	def turn
		player = self.current_player
		attempted_move = player.move(self.board)
  		if self.board.valid_move?(attempted_move)
    		self.board.update(attempted_move,current_player)
    		self.board.display
		else
			self.turn
		end
	end

	def play
		until self.over? == true
			self.turn
		end
		if self.won? != false
			game_winner = self.winner
			puts "Congratulations #{game_winner}!"
		elsif self.draw? == true
			puts "Cats Game!"
		end
	end

end
