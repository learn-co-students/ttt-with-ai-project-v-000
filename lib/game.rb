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
    [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.find do |win|
      board.cells[win[0]] == board.cells[win[1]] &&
      board.cells[win[1]] == board.cells[win[2]] &&
      (board.cells[win[0]] == "X" || board.cells[win[0]] == "O")
    end
  end

  def draw?
    board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if win_combo = won?
      winner = board.cells[win_combo.first]
    end
  end

  def turn
    puts "Please make your move boss."
    if valid_move?(input) && taken?(input) == true
      make move
    else
    puts "That is not a valid move boss dog, please make a valid move."
  end
    if turn_count == 1
      player_2 move
    end
end
