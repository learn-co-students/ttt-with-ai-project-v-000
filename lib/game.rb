class Game
  attr_accessor :player_1, :player_2, :board

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2],
  ]
  
  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_combination.all? {|win_index| @board.cells[win_index] == @player_1.token } ||
      win_combination.all? {|win_index| @board.cells[win_index] == @player_2.token }
    end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    won? && @board.cells[won?[0]]
  end

  def turn
    player_move = current_player.move(@board.cells)
    if @board.valid_move?(player_move)
      @board.update(player_move, current_player)
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