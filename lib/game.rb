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
      [6, 4, 2],
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1; @player_2 = player_2; @board = board
  end

  def current_player
    (board.turn_count % 2 == 0) ? @player_1 : @player_2
  end

  def over?
    (board.full? && WIN_COMBINATIONS) ? true : false
  end

  def won?
    WIN_COMBINATIONS.detect do |win|
      win.all? {|i| board.cells[i] == "X"} || win.all? {|i| board.cells[i] == "O"}
    end
  end

  def draw?
    !won? && over?
  end

  def winner
    if move = won?
      board.cells[move.first]
    end
  end

  def turn
    choice = current_player.move(board)
    if !board.valid_move?(choice)
      puts "invalid"; turn
    else
      board.update(choice, current_player); board.display
    end
  end

  def play
    until won? || draw?; turn end
    if won?; puts "Congratulations #{winner}!"
    else draw?; puts "Cats Game!" end
  end
end
