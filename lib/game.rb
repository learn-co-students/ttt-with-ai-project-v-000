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
	[2,4,6],
	]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  	@board = board
  	@player_1 = player_1
  	@player_2 = player_2
  end

  def current_player
  	@board.turn_count.even? ? player_1 : player_2
  end

  def over?
  	won? || draw?
  end

  def won?
    WIN_COMBINATIONS.each do |win_array|
      if @board.cells[win_array[0]] == "X" && @board.cells[win_array[1]] == "X" && @board.cells[win_array[2]] == "X" ||
        @board.cells[win_array[0]] == "O" && @board.cells[win_array[1]] == "O" && @board.cells[win_array[2]] == "O"
        return win_array
      end
    end 
    false
  end

  def draw?
  	@board.full? && !won?
  end

  def winner
  	@board.cells[won?[0]] if won?
  end

  def turn 
  	current_move = current_player.move(@board)
  	if @board.valid_move?(current_move)
  	  @board.update(current_move, current_player)
  	  @board.display
  	  puts "What'll you do now?!?"
  	 else
  	   turn
  	end
  end

  def play
  	while !over?
      turn
  	end
  	if won?
  	  puts "Congratulations #{winner}!"
  	elsif draw?
  	  puts "Cat's Game!"
  	end
  end

end