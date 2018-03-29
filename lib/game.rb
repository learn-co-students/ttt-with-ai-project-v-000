require 'pry'

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
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.find do |win_combination|
      board.cells[win_combination[0]] == board.cells[win_combination[1]] &&
      board.cells[win_combination[1]] == board.cells[win_combination[2]] &&
      board.taken?(win_combination[0] + 1)
    end
  end

  def draw?
    board.full? && !won?
  end

  def over?
    (won? || draw?) ? true : false
  end

  def winner
    won? ? board.cells[won?[0]] : nil
  end

  def turn
    player = current_player
    current_move = player.move(board)
    if !board.valid_move?(current_move)
      turn
    else
      board.update(current_move, player)
      board.display
      puts # creates a line of blank space between each turn's board state for easier readability
    end
  end

  def play
    until over?
      turn
    end
    sleep 0.5
    puts (draw? ? "Cat's Game!" : "Congratulations #{winner}!")
  end

end
