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

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      combo.all? {|i| board.cells[i] == "X"} || combo.all? {|i| board.cells[i] == "O"}
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    board.cells[won?.first] if won?
  end

  def turn
    cell = current_player.move(board)

    until board.valid_move?(cell)
      turn
      return
    end

    board.update(cell, current_player)
  end

  def play
    until over?
      turn
    end

    puts won? ? "Congratulations #{winner}!" :  "Cats Game!"
  end

end
