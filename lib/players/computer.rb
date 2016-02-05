require 'pry'
class Computer < Player
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
	CENTER = 5
	EDGES = [2, 4, 6, 8]
	CORNERS  = [1, 3, 7, 9]
	
	#attr_accessor :board
	attr_reader :first_move
	
	def move(board)
		#@board = board
		board.turn_count.even? ? offensive_move(board).to_s : defensive_move(board).to_s
	end
	
	def offensive_move(board)
		
		if board.turn_count < 1
			@first_move = CORNERS.sample
			first_move
			
		#second computer turn
		elsif board.turn_count < 2 && board.taken?(CENTER)
			# they went center, go opposite!
			get_opposite_corner(first_move)
			
		else
			# try to win or pick an open corner
			!next_move(board).nil? ? next_move(board) : choose_valid_space(CORNERS, board)
		end
	end
	
	def defensive_move(board)
		
		if board.turn_count < 2 && corner_picked?(board)
			@first_move = CENTER
			CENTER
			
		#defense against opponents first corner move
		elsif @first_move == CENTER
			# try to win or pick an open edge
			!next_move(board).nil? ? next_move(board) : choose_valid_space(EDGES, board)
		else
			
			# try to win or pick an open corner
			!next_move(board).nil? ? next_move(board) : choose_valid_space(CORNERS, board)
		end
	end
	
	# moves to the open space if there is a three in a row
	def next_move(board)
		move = nil
		WIN_COMBINATIONS.each do |combo|
			temp = combo.collect {|i| board.position(i+1)}
			#must have one open space and 2 of either token (XX or OO)
			if temp.reject {|x| x == " " }.length == 2 && temp.count(self.token) != 1
				move = combo[temp.index(" ")] + 1 #1 to offset index and player_index
				break if temp.count(self.token) == 2 #found a winner! otherwise we keep going as this move found two of opponents spots and we want to see if we can win now or block
			end
		end
		move
	end
	
	def get_opposite_corner(move)
		10 - move
	end
	
	# tries to get a corner or edge otherwise nabs an empty space
	def choose_valid_space(first_choice, board)
		if choose_valid(first_choice, board).nil?
			first_choice == EDGES ? choose_valid(CORNERS, board) : choose_valid(EDGES, board)
		else
			choose_valid(first_choice, board)
		end
	end
	
	def choose_valid(positions, board)
		positions.each do |position|
			if board.valid_move?(position)
				return position
				break
			end
		end
	end
	
	def corner_picked?(board)
		CORNERS.any? {|corner| board.taken?(corner)}
	end
	
end