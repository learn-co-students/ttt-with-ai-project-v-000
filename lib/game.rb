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

  def initialize(player_1=Human.new("X"), player_2=Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    turn = self.board.turn_count
    turn % 2 == 0 ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end

  def draw?
  	!won? && @board.full?
  end

  def winner
  	if won?
  		token_array = won?
  		token = token_array[0]
  		return @board.cells[token]
  	end
  end

  def turn
    self.board.display
    puts "Please enter 1-9:"
    current_move = self.current_player.move(self.board)

    if !self.board.valid_move?(current_move)
      #binding.pry
      self.turn
    end

    self.board.update(current_move, self.current_player)
    self.board.display
  end

  def play
    while !over?
      #binding.pry
      turn
    end

    if won?
      the_winner = winner
      puts "Congratulations #{the_winner}!"
    else
      puts "Cats Game!"
    end
  end

end
