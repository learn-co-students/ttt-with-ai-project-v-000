class Game

  attr_accessor :board, :player_1, :player_2, :winning_combo

  #Possible Winning Outcomes (This is a constant)
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8,], #Horizontal Wins
  [0,3,6], [1,4,7], [2,5,8], #Vertical Wins
  [0,4,8], [6,4,2]] #Diagonal Wins

  def initialize (player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    #If/else shorthand site to recall: https://www.natashatherobot.com/ruby-shorthands-if-then-else/
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    #If else short hand if the to board is full the game is over if it is not full it is false
    won? || draw? ? true : false
  end

  def won?
    #Need further explanation on this method from tech coach
    @winning_combo = WIN_COMBINATIONS.detect {|combo| @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[0]] == @board.cells[combo[2]] && @board.taken?(combo[0] + 1)}
  end

  def draw?
    @board.full? && !won? ? true : false
  end

  def winner
    @winner = @board.cells[@winning_combo.first] if @winning_combo = won?
  end

  def turn
    input = current_player.move(board)
    @board.valid_move?(input) ? @board.update(input, current_player) && @board.display : turn
  end

  def play
    turn until over?
    won? ? (puts "Congratulations #{winner}!") : (puts "Cat's Game!")
  end

end
