class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],[0,3,6],[1,4,7],[2,5,8],[3,4,5],[6,7,8],[0,4,8],[2,4,6]]
  

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
  	@board = board
  	@player_1 = player_1
  	@player_2 = player_2
  end

  def current_player
  	if board.turn_count.even?
  		player_1
  	else
  		player_2
  	end
  end

  def over?
  	won? || draw?
  end

  def won?
  	WIN_COMBINATIONS.detect do |combo|
  	  combo.all? {|p| board.cells[p] == "X"} || combo.all? {|p| board.cells[p] == "O"}
  	end
  end

  def draw?
  	!won? && board.full?
  end

  def winner
  	winner = won?
  	if !won?
  	  nil
  	else
  	  board.cells[winner[0]]
  	end
  end 

  def turn
  	input = current_player.move(board)
  	if board.valid_move?(input)
  		board.update(input, current_player)
  	else
  		current_player.move(board) 
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end





