class Game
  attr_accessor :board, :player_1, :player_2
  attr_reader :token

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]


  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
   won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.taken?(combo[0] + 1) &&
      board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]]
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    won? ? board.cells[won?[0]] : nil
  end

  def turn
    current_move = current_player.move(board)
    if board.valid_move?(current_move)
      board.update(current_move, current_player)
    else
      turn
    end
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end

end
