class Game
	attr_accessor :board, :player_1, :player_2
	#winning combinations
	WIN_COMBINATIONS = [
 	  [0,1,2],
 	  [3,4,5],
 	  [6,7,8],
	  [0,3,6],
    [1,4,7],
  	[2,5,8],
  	[0,4,8],
  	[6,4,2]
	]
	def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
	  self.gets_players
    	@board = board
    	#@player_1 = player_1
    	#@player_2 = player_2
  end #end of the initialize method
	
	def over?
  		won? || draw?
	end #end of over


	def current_player
  		@board.turn_count % 2 == 0 ? @player_1 : @player_2
	end #end of current_player

	def winner
	  if winning_combo = won?
  			@winner=@board.cells[winning_combo.first]
		end #end of if
	end #end of winner

	def turn
		player=current_player
		 current_move = player.move(@board)
    		if !@board.valid_move?(current_move)
    			turn
    		else
      		puts "Turn: #{@board.turn_count+1}\n"
     		@board.display
    			@board.update(current_move, player)
      		puts "#{player.token} moved #{current_move}"
      		@board.display
      		puts "\n"
    		end #end of if/else
	end	#end of turn


	#the play
	def play
  		while !over?
    			turn
  			end #end of while !over
  		if won?
    			puts "Congratulations #{winner}!"
  		elsif draw?
    			puts "Cat's Game!"
  			end
		end

		
	def won?
  	 WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
  		end #end of do
	end #end of won?



	def draw?
  		!won? && @board.full?
	end #end of draw
  	#gets players
	def gets_players
			puts "Enter the number of human players."
		players=gets.strip.to_i
		if players == 0
			@player_1=Players::Computer.new("X")
			@player_2=Players::Computer.new("O")
		elsif players ==  1
			rando=[1,2].sample
			if rando==1
				@player_1=Players::Human.new("X")
				@player_2=Players::Computer.new("O")
			else
				@player_1=Players::Computer.new("X")
				@player_2=Players::Human.new("O")
			end#end random assignment
		elsif players == 2
			@player_1=Players::Human.new("X")
			@player_2=Players::Human.new("O")	
		else 
			puts "you did not enter a valid number."
			gets_players
		end #end of if for players
	end #end of gets_players

end #end of Game class