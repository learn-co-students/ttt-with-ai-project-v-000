class Game

	attr_accessor :board, :player_1, :player_2

	
	 WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
	 
	 def initialize(p1 = Player::Human.new("X"), p2 = Player::Human.new("O"), board = Board.new)
	 	@board = board
	 	@player_1 = p1
	 	@player_2 = p2
	 end

	 def turn_count
	 	board.cells.count(player_1.token) + board.cells.count(player_2.token)
	 end

	 def current_player
	 	if turn_count == 0 || turn_count.even?
	 		player_1	
	 	else 
	 		player_2
	 	end
	 end

	 def over?
	 	draw? || won?
	 end

	 def won?
	 	WIN_COMBINATIONS.any? do |combo|
	 		 board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
	 	end
	 end

	 def draw?
	 	 !won? && board.full?
	 end

	 def winner
	 	wincombo = WIN_COMBINATIONS.detect do |combo|
	 		 board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
	 		end
	 	return wincombo if wincombo == nil
	 	board.cells[wincombo[0]] if board.cells[wincombo[0]] == "X" || board.cells[wincombo[0]] == "O"
	 end

	 def turn
	 	board.display
	 	move = current_player.move(board)
	 	if !board.valid_move?(move)
	 		turn
	 	else
	 		board.cells[move.to_i - 1] = current_player.token
	 	end
	 end

	 def play
	 	while !over?
	 		turn
	 	end
	 	if won?
	 		board.display
	 		puts"Congratulations #{winner}!"
	 	elsif draw?
	 		board.display
	 		puts "Cats Game!"
	 	end
	 end

	 


end


































