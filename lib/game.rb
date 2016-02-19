require "pry"
class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      combo.all? { |position| board.position(position) == player_1.token } || combo.all? { |position| board.position(position) == player_2.token}
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    if won?
      win_combo = WIN_COMBINATIONS.detect { |combo| combo.all? { |position| board.position(position) == player_1.token } || combo.all? { |position| board.position(position) == player_2.token} }
      board.position(win_combo[0])
    else 
      nil
    end
  end

  def turn
    board.display
    input = ""
    until board.valid_move?(input) do
      input = current_player.move(board)
    end
    board.update(input, current_player)
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end




end