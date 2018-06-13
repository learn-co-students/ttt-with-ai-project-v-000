class Game

  WIN_COMBINATIONS = [
    [0,3,6],
    [0,4,8],
    [0,1,2],
    [1,4,7],
    [2,4,6],
    [2,5,8],
    [3,4,5],
    [6,7,8]
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = nil)
    board ? @board = board : @board = Board.new
    @player_1 = player_1 if player_1
    @player_2 = player_2 if player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect {|combo| @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[0]] == @board.cells[combo[2]] && @board.taken?(combo[0] + 1)}
  end

  def draw?
    !won? if @board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    winning_combo = won?
    @board.cells[winning_combo.first] if winning_combo
  end

  def turn
    current_player.move(@board)
  end

  def play
    while !over?
      turn
      @board.display
      puts "" #adds readability
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
end
