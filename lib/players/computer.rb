require 'set'

module Players

	class Computer < Player  

		ARRAY_OF_WINNING_SETS = []
		Game::WIN_COMBINATIONS.each {|combo| ARRAY_OF_WINNING_SETS << Set.new(combo)}
		

		def move(board = nil)
		  @x_set = Set.new(board.cells.select {|cell| cell == "X"})
		  @o_set = Set.new(board.cells.select {|cell| cell == "O"})
		  corners = %w{0 2 6 8}
		  case board.turn_count
		  when 0
		  	move = "4"
		  when 1
		  	unless board.cells.include?(4)
		  		move = "4"
		  	else
		  		move = corners.random
		  	end
		  when 2
		  	poss_corners = corners.select {|corner| corner == " "}
		  	move = poss_corners.random
		  else
		  	if current_player.token == "X"
		  		ARRAY_OF_WINNING_SETS.each do |set|
		  			if set&(@x_set).size == 2 && set&(@y_set).size == 0   #offense
		  			  move = set - set&(@x_set)
		  			  return
		  			end
		  		end
		  		ARRAY_OF_WINNING_SETS.each do |set|
		  			if set&(@y_set).size == 2 && set&(@x_set).size == 0   #defense
		  				move = set - set&(@y_set)
		  				return
		  			end
		  		end
		  		poss_corners = corners.select {|corner| corner == " "}    #unlikely event that y did not place a first turn corner move
		  		poss_corners.random
		  	elsif current_player.token == "O"
		  		ARRAY_OF_WINNING_SETS.each do |set|
		  			if set&(@y_set).size == 2 && set&(@x_set).size == 0   #offense
		  			  move = set - set&(@y_set)
		  			  return
		  			end
		  		end
		  		ARRAY_OF_WINNING_SETS.each do |set|
		  			if set&(@x_set).size == 2 && set&(@y_set).size == 0   #defense
		  				move = set - set&(@x_set)
		  				return
		  			end
		  		end
		  	end
		end
	end
  end
end
 