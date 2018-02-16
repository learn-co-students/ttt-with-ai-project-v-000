class Game
  attr_accessor :board, :player_1, :player_2
  attr_reader

  WIN_COMBINATIONS = [
    [2,5,8],
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [0,4,8],
    [6,4,2]]

  def initialize(p1 = Players::Human.new("X"), p2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = p1
    @player_2 = p2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] != " " &&
      board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]]
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
     board.cells[won?[0]] if won?
  end

  def turn
    move = current_player.move(board)
    turn if !board.valid_move?(move)
    board.update(move, current_player)

  end

  def play
    turn until over?

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

  def start

  end
end
