require 'pry'


class Computer < Player

	attr_accessor :current_move_count,:edge_strategy, :board



	def move(board)

=begin
I think to refine the code a little bit we should get rid of the if self.token
I know we planned out to use it originally, but I think instead we should start
structure the code as follows. Kep in mind that I am just trying to show strucure
because I am not positive I understand your code. For example I don't see your
game.can_win method.

@currrent_move_count = 0
if @current_move_count  >= 2 $$ game.can_win?
	move = move_block_win
elsif @current_move_count ==0 $$ board.center[0] = ""
	move = board.center[0]
elsif @current_move_count == 0
	take corner (not entering value until I go over with you)
elsif @current_move_count == 1 ... so on and so forth. I didn't want to fill out
the code because I am not quite sure thai I won't mess up your algo.

#notes 2,1--> everything should working including last_turn_corner. Move diagonal corner keeps causing infinite loops.
But the values within that method all show correctly. Still working it.

=end

		@board = board
		@current_move_count = 0 if !@current_move_count

		if @current_move_count == 0 && board.valid_move?(board.center[0])

			move = board.center[0]
		elsif @current_move_count == 0
			move = self.move_corner
@current_move_count  >= 2 && @game.can_win?

		else
			if last_turn_corner?
				#move_to_diagonal_corner
				#binding.pry
			end
		end
		@current_move_count += 1
		move = move.to_s

	end
=begin
				@current_move_count += 1
				elsif @current_move_count == 1
					if last_turn_edge
						@current_move_count += 1
						@edge_strategy = true
						move = move_corner_on_other_side

					elsif last_turn_corner
						@current_move_count += 1
						move = move_to_diagonal_corner
					end
				elsif @current_move_count >= 2 && @edge_strategy
					move = move_block_win
				else @current_move_count >= 2
					move = move_block_win
			end
			move.to_s
		end
=end



	## Helper Methods


	def last_turn_edge?
		@board.edges.detect {|edge| edges == game.last_turn }
	end

	def move_corner_on_other_side
		if last_turn_edge == 1 || last_turn_edge == 3
			move = @board.corners[8]
		elsif last_turn_edge == 5 || last_turn_edge == 7
			move = @board.corners[1]
		end
	end

	def move_to_diagonal_corner
		#binding.pry

		if last_turn_corner? == 1
			move = @board.corners[3]
		elsif last_turn_corner? == 3
			move = @board.corners[2]
		elsif last_turn_corner? == 7
			move = @board.corners[1]
		elsif last_turn_corner? == 9
			move = @board.corners[0]
		end
	end

	def move_block_win
		game.can_win? if game.can_win?
	end

	def move_corner
		@board.corners.detect do |corner|
		@board.valid_move?(corner)
		end
	end

	def last_turn_center?
		last_turn = game.last_turn.to_i
		@board.taken(last_turn)

	end

	def move_edges
		edge = @edges.detect {|edge| board.valid_move?(@board.cells[edge]) }
	end

	def last_turn_corner?
		@board.corners.detect do |corner|

		 corner == @board.last_turn.to_i
		end
	end

end



=begin
	1.How computer player will never lose.
		 Determines if it gets to go first or not.
			A. If first
				1.  Turn-1 == @current_move_count
					i Pick Center

					a.  Turn 2- @current_move_count

						i If other player picked an edge piece Last turn

							a. if oth_last_turn_edge
								(move 3,4,5 etc) == oppon_started_edge_strat

						ii. If other player picked corner last turn
								a. Place your token on diagonally opposite
								corner.
							 i. Turn 3 @current_move_count
									i. If player picked edge position last turn
										if can_player_win?
											move_block_win
											else
												move to corner opposite of players last turn
												a. . Turn 4 @current_move_count
												move_block_win
												#***GAME OVER***
									ii. If player picked corner position
										move_block_win until game over
										#*** tie
			B. If 2nd(second_player -> object)
				1. Move-1
					a. If oth_last_turn_corner
						self.position = center.
						i. Move-2
							a. if oth_last_turn_corner
								move_edge
								ii. Move- 3
									Move_block_win
								iii. Move- 4
									Move_block_win until board full
						ii. Move-2
							a. if oth_last_turn_edge
								(move 3,4,5 etc) == oppon_started_edge_strat

						i.Move-3
						i.Move 4

					b. If   oth_last_turn == center[0]
						i. move corner
							i. move-2
								q. if can_player_win?(first_player)
									move_block_win
										Move - 3 and 4 -->  move_block_win until game over( win or tie.)
								b. if oth_last_turn_corner
									move corner
										Move 3 and 4 move_block win

	####	NEED TO BUILD CAN PLAYER WIN?
		and MOVE BLOCK WIN

		def oppon_started_edge_strat
			a. Pick one of 2 corners opposite of other
							players edge token.

								i. Turn 3 @current_move_count
									a. If win combination position a valid move?
										i. Move to win position
										#***GAME OVER*** Win
									b. else
										i. move_block_win
										 a. Turn 4 @current_move_count
											i. move_block_win
										***GAME OVER*** Win
		end

		player
		def current_move_count # tells self what move it's on
			move_count = board_obj.cells.select {|cell| cell == self.token}
			@current_move_count = move_count.size + 1
		end

		def can_player_win? # checks board if win is possible by either player

			looks to see if an win combo arrays are have 1 vacant position
			checks if all tokens are the same i.e all X's or all O's
			if the same returns that token
		end



		def last_turn_edge?
			@edges.detect {|edge| edges == game.last_turn }
		end


		def move_block_win
			if can_player_win? ==self.token
				fill wining position with self.token
				can_player_win? == other_player.token
				fill with token
			end

		move_opposite_corner






	def 0_player_game
		first_player = Computer.new("X")
		second_player = Computer.new("O")
		board = Board.new


	end

=end
