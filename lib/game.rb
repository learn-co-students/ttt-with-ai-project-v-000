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

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Array.new(9, " "))
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count %2 == 0 ? @player_1 : @player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells.[combo[0]] ==  @board.cells.[combo[1]]&&
      @board.cells.[combo[1]] ==  @board.cells.[combo[2]] &&
      @board.taken?(combo[2]+1)
    end
  end

  def draw?
    !won? && @board.turn_count == 9
  end

  def winner
    if win_combo = won?
      @winner = @board.cells[win_combo[0]]
  end

  def turn
    gets.strip
    
  end

end
