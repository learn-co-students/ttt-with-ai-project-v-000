class Game
	attr_accessor :board, :player_1, :player_2

	WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]


  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board = Board.new)
  	@player_1 = player_1
  	@player_2 = player_2
  	@board = board
    
  end

  def current_player
  	if board.turn_count.even?
  		player_1
  	else
  		player_2
  	end
  end

  def full?
  	if board.any?{|i| i != player_1 && i != player_2}
  		false
  	else
  		true
  	end		
  end

  def won?
	WIN_COMBINATIONS.find do |combo|
  		self.board.cells[combo[0]] == self.board.cells[combo[1]] && self.board.cells[combo[1]] == self.board.cells[combo[2]] && self.board.cells[combo[0]] != " "
  	end
  end

  def draw?
  	board.full? && !won?
  end

  def over?
  	draw? || won?
  end

  def winner
  	if won?
  		board.cells[won?[0]]
  	end
  end

  def turn
  	player = current_player
  	player_move = player.move(self.board).to_i
  	if self.board.valid_move?(player_move)
  		self.board.update(player_move, player)
  		self.board.display
  	else
  		turn
  	end
  end

  def play
  	turn until over?
  	if won?
  		puts "Congratulations #{winner}!"
  	elsif draw?
  		puts "Cat's Game!"
  	end
  end

end








