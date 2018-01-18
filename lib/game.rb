# a singular instance of a Tic Tac Toe session
class Game

	attr_accessor :board, :player_1, :player_2

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
		@board = board
		@player_1 = player_1
		@player_2 = player_2
	end

	def current_player
		@board.turn_count.odd? ? @player_2 : @player_1
	end

	def over?
		draw? || won?
	end

	def won?
		!winner.nil?
	end

	def draw?
		@board.full? && !won?
	end

	def winner
		cells = @board.cells
		winning_combination = WIN_COMBINATIONS.find do |combination|
			cells[combination[0]] == cells[combination[1]] && cells[combination[1]] == cells[combination[2]] && cells[combination[0]] != " "
		end 
		winning_combination ? cells[winning_combination[0]] : nil
	end

	def play
		@board.display
		turn until over?
		if won?
			puts "Congratulations #{winner}!"
		elsif draw?
			puts "Cat's Game!"
		end
	end

	# calls the current_player for input
	def turn
		player = current_player
		current_move = player.move(@board)
		
		if !@board.valid_move?(current_move)
			turn
		else
			puts "Turn: #{@board.turn_count+1}\n"
			@board.display
			@board.update(current_move, player)
			puts "#{player.token} moved #{current_move}"
			@board.display
			puts "\n\n"
		end
	end
end