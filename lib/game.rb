class Game
	attr_accessor :board, :player_1, :player_2
	WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
	def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
		@player_1 = player_1
		@player_2 = player_2
		@board = board
	end

	def current_player
		turn_count.even? ? player_1 : player_2
	end

  def turn_count
	  turn = 0
	  board.cells.each do |item|
	    turn+=1 if(item=="O" || item=="X")
	  end
	  turn
	end

	def draw?
		true if !won? && full?
	end

  def won?
    WIN_COMBINATIONS.each do |win|
      if win.all? { |ind| self.board.cells[ind] =="X" } || win.all? { |ind|  self.board.cells[ind] =="O" }
        return win
      end
    end
    false
  end

  def full?
    !board.cells.any?{|i| i==" "}
  end

  def over?
    won? || draw? || full?
  end

  def winner
    winning_combo = won?
    if winning_combo
      board.cells[winning_combo[0]]
    else
      nil
    end
  end

	def turn
		move_choice = current_player.move(board)
		if board.valid_move?(move_choice)
			board.update(move_choice,current_player)
			board.display
		else
			self.turn
		end
	end

	def play
		while !self.over?
		 	self.turn
		end

		if self.draw?
			puts "Cat's Game!"
		else
			puts "Congratulations #{self.winner}!"
		end
	end

end
