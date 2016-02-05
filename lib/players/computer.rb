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
	CENTER = 4
	EDGES = [1, 3, 5, 7 ]
	CORNERS  = [0, 2, 6, 8]
	
	attr_reader :first_move, :board
	
	def move(board)
		@board = board
		board.turn_count.even? ? offensive_move : defensive_move
	end
	
	def offensive_move
		if board.turn_count < 1
			@first_move = CORNERS.sample
			first_move
			
		#second computer turn
		elsif board.turn_count < 2 && board.taken?(CENTER)
			# they went center, go opposite!
			get_opposite_corner(first_move)
			
		else
			# try to win or pick an open corner
			!next_move.nil? ? next_move : choose_valid(CORNERS)
		end
	end
	
	def defensive_move
		if board.turn_count < 2 && corner_picked
			@first_move = CENTER
			CENTER
			
		#defense against opponents first corner move
		elsif @first_move = CENTER
			# try to win or pick an open edge
			!next_move.nil? ? next_move : choose_valid(EDGES)
		else
			# try to win or pick an open corner
			!next_move.nil? ? next_move : choose_valid(CORNERS)
		end
	end
	
	# moves to the open space if there is a three in a row
	def next_move
		move
		WIN_COMBINATIONS.each do |combo|
			temp = combo.collect {|i| board.position(i)}
			#must have one open space and 2 of either token (XX or OO)
			if temp.reject(" ").length == 2 && temp.count(self.token) != 1
				move = combo[temp.index(" ")]
				break
			end
		end
		move
	end
	
	def get_opposite_corner(move)
		8 - move
	end
	
	def choose_valid(positions)
		positions.each do |position|
			if board.valid_move?(position)
				return position
				break
			end
		end
	end
	
	def corner_picked?
		CORNERS.any? {|corner| board.taken?(corner)}
	end
	
end