class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5],
    [6, 7, 8], [0, 3, 6],
    [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [6, 4, 2]
]

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2 # calls #turn_count method from Board class, if it returns even, it's player_1 is current_player
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo| # iterates over each element, which are nested arrays, in the WIN_COMBINATIONS []
      # .all? passes each element of win_combo to black, returns true if the block never returns false or nil
      win_combo.all? { |win_play| board.cells[win_play] == "X" } || win_combo.all? { |win_play| board.cells[win_play] == "O" }
    end
  end

  def draw?
    !won? && full?
  end

  def full?
    board.cells.all? { |token| token == "X" || token == "O" } # returns true if elements in cells [] have an "X" or "O"
  end

  def winner
    if won?
      win_combo = won?
      board.cells[win_combo[0]]
    end
  end

  def turn
    position = current_player.move(board) # it reaches into #current_player, in order to call #move by passing in board
    until board.valid_move?(position) # loops until #valid_move?() returns true
      puts "invalid input. Please select an empty space between 1 and 9"
      position = current_player.move(board)
    end
    board.update(position, current_player)
  end

  def play
    board.display
    until over? # loops until condition is true
      turn
      board.display
    end
    puts "Congratulations #{winner}!" if won?
    puts "Cats Game!" if draw?
  end

end
