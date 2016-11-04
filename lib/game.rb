require 'pry'
class Game < AI 
	
	attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
	  [0,1,2], #Top row
		[3,4,5], #Middle row
		[6,7,8], #Bottem row
		[0,3,6], #Left column
		[1,4,7], #Middle column
		[2,5,8], #Right column	
		[0,4,8], #Top left to bottom right
		[2,4,6]  #Top right to bottom left
	]

	def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
		@player_1 = player_1
		@player_2 = player_2
		@board = board
		@player_1.game = self
		@player_2.game = self
	end
  
	def current_player  
		@board.turn_count % 2  == 0 ? @player_1 : @player_2
	end

	def over?
		self.won? || self.draw?
	end

	def won?
		WIN_COMBINATIONS.detect do |win_combo| 
			 tokens = @board.cells.values_at(win_combo[0], win_combo[1], win_combo[2]).uniq
			 tokens.size == 1 && tokens[0] != " "
	  end 
	end

	def draw?
		!self.won? && @board.full?	
	end

	def winner
		if self.won? 
		  @winner = @board.cells[self.won?.first]
		end   
	end

	def turn
		player = current_player
		player_move = player.move(@board)

		if @board.valid_move?(player_move)
			 puts "Turn #{@board.turn_count}"
			 @board.update(player_move, player)
			 @board.display
		else
		   self.turn
		end 
    
	end

  def play
     while !self.over?
       self.turn
     end

     if self.won?
       puts "Congratulations #{self.winner}!"
     elsif self.draw?
       puts "Cats Game!"
     end        	  
  end

end 
