class Game
	attr_accessor :board, :player_1, :player_2
	attr_reader :win_indexes

	def initialize(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
		@player_1 = player_1
		@player_2 = player_2
		@board = board
		@player_2.game = self 
		@player_1.game = self 
	end

	WIN_COMBINATIONS =[
    	[0, 1, 2],
    	[3, 4, 5],
    	[6, 7, 8],
    	[0, 4, 8],
    	[2, 4, 6],
    	[0, 3, 6],
    	[1, 4, 7],
    	[2, 5, 8]
  	]

  	def current_player
  		@board.turn_count.even? ? @player_1 : @player_2
  	end

  	def self.win_combinations 
  		const_get("WIN_COMBINATIONS")
  	end

  	def draw?
  		@board.full? && !self.won?
  	end

  	def win_indexes
  		@win_indexes = WIN_COMBINATIONS.collect{|combo| combo.collect{|index| @board.position(index+1)}}
  	end

  	def won?
  		self.win_indexes
  		@win_indexes.include?(["X","X","X"]) || win_indexes.include?(["O","O","O"]) 
  	end

  	def over?
  		self.draw? || self.won?
  	end

  	def winner
  		self.win_indexes
  		if won?
  			@win_indexes.detect{|combo| combo == ["X", "X", "X"] || combo == ["O","O","O"]}[0]
  		else
  			nil
  		end
  	end

  	def turn
  		puts "Player #{current_player.token}, please enter 1-9..."
  		input = current_player.move(@board)
  		self.turn if !@board.valid_move?(input)
  		@board.update(input, current_player)
  		@board.display
  	end

  	def play
    	until over?
      		self.turn
    	end

    	if won?
      		puts "Congratulations #{winner}!"
    	else
      		puts "Cat's Game!"
    	end
  	end


end