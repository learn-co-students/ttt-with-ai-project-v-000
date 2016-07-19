# Game Class
class Game
  attr_accessor :board, :player_1, :player_2, :winner

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ].freeze

  def initialize(player_1 = nil, player_2 = nil, board = nil)
    player_1 = Players::Human.new('X') if player_1.nil?
    player_2 = Players::Human.new('O') if player_2.nil?
    board = Board.new if board.nil?

    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.odd? ? player_2 : player_1
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if @board.valid_move?(current_move)
      @board.update(current_move, player)
      @board.display
    else
      turn
    end
  end

  def play
    turn until over?

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts 'Cats Game!'
    end
  end

  def over?
    won? || draw?
  end

  def draw?
    @board.full? && !won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && @board.taken?(combo[0]+1)
    end
  end

  def winner
    winning_combo = won?
    @winner = @board.cells[winning_combo.first] if winning_combo
  end
end
