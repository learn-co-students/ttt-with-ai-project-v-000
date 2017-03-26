
# Computer sub-class of Player
class Players::Computer < Player

	attr_accessor :other_player_positions, :current_player_positions, :move_o, :move_c

	# Winning combinations to win a game of Tic Tac Toe
	WIN_COMBINATIONS = {:WIN_1 => ["1","2","3"], :WIN_2 => ["4","5","6"], :WIN_3 => ["7","8","9"], :WIN_4 => ["1","4","7"],
	:WIN_5 => ["2","5","8"], :WIN_6 => ["3","6","9"], :WIN_7 => ["1","5","9"], :WIN_8 => ["7","5","3"]}

	def initialize(token)
		super
		@other_player_positions = []  # Holds the other player's current held positions
		@current_player_positions = []  # Holds the current player's current held positions
		@move_o = []
		@move_c = []
	end

	# Accepts the Computer's move for its turn of the game
	def move(board)
		move = 0  # Variable to hold the Computer player's selected move
		position = 0
		place = 0
		edge = 0
		corner = 0
		computer_move = []  # Array to hold the moves available to the current Computer player
		valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]  # Defines allowed moves in a Tic Tac Toe game
		# Bring in some artificial intelligence
		position = ai_block_win(board)
		place = ai_best_moves(board)
		edge = ai_strategy_edges(board)
		corner = ai_strategy_corners(board)
		# End artificial intelligence
		valid_moves.each_with_index do |a,i|  # Checks which of its valid moves are available to the Computer player
			if board.valid_move?(a)
				computer_move << ((i + 1).to_s)  # If the move is valid add it to the available moves array
			end
		end
		if position != nil && !position.empty? && board.valid_move?(position[0][0]) # If move is valid and not nil or empty move takes position
			move = position[0]
		elsif edge != nil  # If move returned by edge exists
			move = edge
		elsif corner != nil  # If move returned by corner exists
			move = corner
		elsif place != nil  # If move returned by place exists
			move = place
		else
			move = computer_move.sample  # Take a random move from the available moves array if no other moves valid
		end
		move  # Return the move to be made to #game
	end

	# Whose turn is it - identify the current player by which turn the game is up to
	# Player one goes first with the "X" token
	def current_player(board)
		if board.turn_count.odd?
			"O" # If the number of turns is an odd number it is Player two with the "O" token
		else
			"X"  # If the number of turns is an even number it is Player one with the "X" token
		end
	end

	# Returns the current positions held on the board for both the current player and the other player
	def player_positions(board)
		if current_player(board) == "X"
			board.cells.each_with_index do |a,i|  # Find the other player's current positions held
				 if a == "O"
					 @other_player_positions << (i + 1).to_s  # the other player is using token "O"
				 end
			end
			board.cells.each_with_index do |a,i|  # Find the current player's current positions held
				 if a == "X"
					 @current_player_positions << (i + 1).to_s  # the current player is using token "X"
				 end
			end
		end
		if current_player(board) == "O"
			board.cells.each_with_index do |a,i|  # Find the other player's current positions held
				 if a == "X"
					 @other_player_positions << (i + 1).to_s  # the other player is using token "X"
				 end
			end
			board.cells.each_with_index do |a,i|  # Find the current player's current positions held
				 if a == "O"
					 @current_player_positions << (i + 1).to_s  # current player is using token "O"
				 end
			end
		end
	end

	# Finds the valid move for current player to block a winning combination for other player
	# Finds the valid move for current player to make a winning combination
	def player_moves(board)
		new_hash_o = {}  # Holds the winning combination positions the other player is occupying
		new_hash_c = {}  # Holds the winning combination positions the current player is occupying
		final_hash_o = {}  # Holds the other player winning combination that need to be blocked on the next move
		final_hash_c = {}  # Holds the move to be made for the current player winning combination
		WIN_COMBINATIONS.each do |k,v|  # Check which of the other player's and current player's positions are part of a winning combination
		  new_hash_o[k] = []
		  new_hash_c[k] = []
		  @other_player_positions.each do |t|  # Check which of the other player's positions are part of a winning combination
			  if v.include?(t)
			 	new_hash_o[k] << t  # If the position is part of a winning combination include it in the new hash
		 	end
		  end
		  @current_player_positions.each do |t|  # Check which of the current player's positions are part of a winning combination
			  if v.include?(t)
			 	new_hash_c[k] << t  # If the position is part of a winning combination include it in the new hash
		 	end
		  end
		end
		@other_player_positions = []  # Clear the other player position results ready for the next turn
		@current_player_positions = []  # Clear the current player position results ready for the next turn
		new_hash_o.each do |k,v|  # Check whether the other player has one move to go on a winning combination
			# If there are two positions of a winning combination held by the other player include the combination in the final hash
			if new_hash_o[k].size > 1
				final_hash_o[k] = new_hash_o[k]  # Final hash holds the vulnerable positions that need to be filled
			end
		end
		new_hash_c.each do |k,v|  # Check whether the current player has one move to go on a winning combination
			# If there are two positions of a winning combination held by the current player include the combination in the final hash
			if new_hash_c[k].size > 1
				final_hash_c[k] = new_hash_c[k]  # Final hash holds the winning positions that need to be filled
			end
		end
		# Find the final position to move to block the other player's winning combination
		 # Find the final position for current player to move to win
		WIN_COMBINATIONS.each do |k,v|
			if final_hash_o.include?(k)
				@move_o << WIN_COMBINATIONS[k] - final_hash_o[k]
				if !board.valid_move?(@move_o[0][0])  # Check whether the final position is a valid move
					@move_o.shift  # If not a valid position remove the final move
				end
			end
			if final_hash_c.include?(k)
				@move_c << WIN_COMBINATIONS[k] - final_hash_c[k]
				if !board.valid_move?(@move_c[0][0])  # Check whether the final position is a valid move
					@move_c.shift  # If not a valid position remove the final move from the array
				end
			end
		end
		if !@move_o.empty?  # Don't test and pass an empty array
				@move_o = @move_o.sample  # Only one move can be made
				@move_o  # Final move to block the other player's winning combination
		end
		if !@move_c.empty?  # Don't test and pass an empty array
				@move_c = @move_c.sample  # Only one move can be made
				@move_c  # Final move to block the other player's winning combination
		end
	end

	# Allows the Computer player to make strategic moves to try and setup a winning game
	def ai_best_moves(board)
		best_move = []
		good_moves = ["1", "3", "5", "7", "9"]  # Best moves to win a game
		best_move = good_moves.select { |a| board.valid_move?(a)}  # Check which best moves are available
		best_move = best_move.sample  # Take a random move from the best moves available
		if best_move != nil  # If a best move is available
			best_move
		else
			nil
		end
	end

	# Allows the Computer player to make an informed decision
	# Does the other player hold 2 positions of any of the winning combinations?
	# If so the current player needs to block them by taking the third available position of the winning combination
	def ai_block_win(board)
		valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
		new_hash = {}  # Holds the winning combination positions the other player is occupying
		final_hash= {}  # Holds the winning combination that need to be blocked on the next move
		move = 0  # variable initialization
		# Define the positions taken on the board by the other player
		# Other player is not the current player
		player_positions(board)
	  player_moves(board)
		if (@move_o == nil && @move_c == nil) || (@move_o.empty? && @move_c.empty?)  # If there are no moves to be made for either player return nil
			move = nil
		elsif @move_o.empty? || @move_o == nil  # if no other player block move then play current player move
			@move_c  # Final single move to be made to make a winning move
		elsif @move_c.empty? || @move_c == nil  # if no current player win move then play other player block move
			@move_o  # Final single move to be made to block other player's winning move
		else
			@move_c  # Final single move to be made to make a winning move
		end
	end

	# Strategy is that if the other player takes an edge then current player should take the centre
	def ai_strategy_edges(board)
		counter = 0
		move = 0
		edges = ["2", "4", "6", "8"]  # Edge positions
		edges.each do |a|
			if @other_player_positions.include?(a)  # Is the other player in an edge position?
				counter+= 1
			end
		end
		if counter > 0 && board.valid_move?("5")  # If the other player is in an edge position and centre position is valid
			counter = 0
			move = "5"  # current player moves to the centre position
		end
	end

	# Strategy is that if the other player has the centre position the current player should
	# take a corner position opposite a corner they already hold
	def ai_strategy_corners(board)
		move = 0
		corners = ["1", "3", "7", "9"]  # Corner positions
		array = []
		corners.each do |a|
			if @current_player_positions.include?(a)  # Is the current player in any of the corner positions?
				array << a  # If current player holds a corner position push the position to array
			end
		end
		# If current player has a corner position and the other player is in the centre position
		if array.length > 0 && @other_player_positions.include?("5")
			array.each do |a|
		# Depending on which corner is held current player takes the opposite corner
				case a
					when "1"
						move = "9"
					when "3"
						move = "7"
					when "7"
						move = "3"
					when "9"
						move = "1"
					else
						break
				end
			end
		end
		if move !=nil && board.valid_move?(move)  # Provided move exists and is valid it is the move
			move
		end
	end
end
