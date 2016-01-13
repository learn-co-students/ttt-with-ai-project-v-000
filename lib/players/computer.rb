require_relative '../player.rb'

class Player::Computer < Player

	# Should make move based on Min Max Algorithm, where it searches results
	# Should make move where all possible end results from this move results in the highest score
	# Wins = +10, Loses = -10 and Draws = 0

	attr_accessor :opponent, :choice

	def initialize(token)
		@token = token
		if @token == "X"
			@opponent = "O"
		else
			@opponent = "X"	
		end
	end

	WIN_COMBINATIONS = [
		[0,1,2], [3,4,5], [6,7,8],	# horizontal wins
		[0,3,6], [1,4,7], [2,5,8],	# vertical wins
		[0,4,8], [6,4,2]			# diagonal wins
	]

	def move(board)
		new_board = board.cells.dup
		minmax(new_board)
		@choice
	end


	# Evaluates if the current player wins, loses or draws and sends back a score based on the result.
	def score(board, depth)
		if winner(board) == @token
			return 10 - depth
		elsif winner(board) == @opponent
			return depth - 10
		else
			return 0
		end
	end

	# Sets the @choice for the computer to send back in #move
	# Recursively makes a new board and keeps making moves until the game is over. It then gets a score and returns that to the top where it gets stored into scores
	def minmax(board, depth = 0)
		return score(board,depth) if over?(board)
		depth += 1
		scores = []
		moves = []

		available_moves(board).each do |move|

			new_board = board.dup
			# If depth is odd, it is the AI's turn
			if depth%2 == 1
				new_board[move.to_i] = @token
			else
				new_board[move.to_i] = @opponent
			end

			scores.push(minmax(new_board, depth))
			moves.push(move)
			break if over?(new_board)
		end

		if depth%2 == 1
			max_score_index = scores.each_with_index.max[1]
			@choice = (moves[max_score_index].to_i + 1).to_s

			return scores[max_score_index]
		else
			min_score_index = scores.each_with_index.min[1]
			@choice = (moves[min_score_index].to_i + 1).to_s
			return scores[min_score_index]
		end
	end

	# Sends back all available spots based on board index (0-8)
	def available_moves(board)
		moves = []
		board.each_with_index{|cell, index| moves << index.to_s if cell == " "}
		moves
	end

	# Methods to determine if over
	def full?(board)
		board.all?{|cell| cell == "X" || cell == "O"}
	end

	def won?(board)
		WIN_COMBINATIONS.detect { |combo| 
			board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[0]] != " "
		}
	end

	def over?(board)
		full?(board) || won?(board)
	end

	def draw?(board)
		!won?(board) && full?(board)
	end

	def winner(board)
		if won?(board)
			return board[won?(board)[0]]
		end
	end
	#///////*******///////#
end

