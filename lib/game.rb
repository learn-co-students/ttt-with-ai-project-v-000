class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2] ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1) ## This is checking to make sure the win_comb is complete and to return the symbol needed in #winner
    end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if win_comb = won?
      @winner = @board.cells[win_comb.first]
    end
  end

  def turn
    player = current_player
    move = player.move(@board)
    if !@board.valid_move?(move) # if move is invaled start over
      turn
    else
      @board.update(move, player) #update board to reflect move
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
