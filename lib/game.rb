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
    [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.find do |win|
      board.cells[win[0]] == board.cells[win[1]] &&
      board.cells[win[1]] == board.cells[win[2]] &&
      (board.cells[win[0]] == "X" || board.cells[win[0]] == "O")
    end
  end

  def draw?
    if !won? && board.full?
      true
    end
  end

  def over?
    if won? || draw?
      true
    end
  end

  def winner
    if won?
      board.cells[won?[0]]
    end
  end

  def turn
    puts "Please take your turn."
    input = current_player.move(input)
    if board.valid_move?(input)
      board.update(input, current_player)
    else
      "Please try again."
      turn
    end
  end

  def play

  end

end
