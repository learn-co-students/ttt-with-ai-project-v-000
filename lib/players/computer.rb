require 'pry'


class Computer < Player

	attr_accessor :current_move_count,:edge_strategy, :board



	def move(board)
		@board = board
		@current_move_count = 0 if !@current_move_count

		if @current_move_count == 0 && board.valid_move?(board.center[0])

			move = board.center[0]
		elsif @current_move_count == 0
			move = self.move_corner
		elsif @current_move_count  >= 1 && @game.can_win?
			if @board.cells[@game.can_win?] == self.token
				binding.pry
				move = move_block_win
			else
				binding.pry
				move = move_block_win
			end
		else
			if last_turn_corner? && @board.valid_move?(move_to_diagonal_corner)

					move = move_to_diagonal_corner	
			elsif	last_turn_corner? && @board.valid_move?(move_corner)
			
				move= move_corner
			elsif move_corner && @board.valid_move?(move_corner)

					move = move_corner				
			else
				binding.pry
				move = move_edges
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

	def empty_space
		@board.cells.each_with_index do |cell, i| 
			return (i + 1)if cell == " "
		end
	end

	def last_turn_edge?
		@board.edges.detect {|edge| edge == game.last_turn }
	end

	def move_corner_on_other_side
		if last_turn_edge == 1 || last_turn_edge == 3
			move = @board.corners[8]
		elsif last_turn_edge == 5 || last_turn_edge == 7
			move = @board.corners[1]
		end
	end

	def move_to_diagonal_corner
		
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
		@game.can_win?
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
		edge = @board.edges.detect {|edge| board.valid_move?(edge) }
	end

	def last_turn_corner?
		self.board.corners.detect do |corner|

		 corner == @game.last_turn.to_i
		
		
		end
	end

end




