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
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      board.cells[combination[0]] == board.cells[combination[1]] &&
      board.cells[combination[1]] == board.cells[combination[2]] &&
      board.taken?(combination[0]+1)
    end
  end

  def draw?
    !won? && board.full?
  end

  def winner
    if win = won?
      winner = board.cells[win.first]
    end
  end

  def turn
    player = current_player
    current_move = player.move(board)
    if !board.valid_move?(current_move)
      turn
    else
      board.update(current_move, player)
      board.display
    end
  end

  def play
    board.display
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end