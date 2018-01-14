class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    (@board.turn_count % 2 == 0) ? self.player_1 : self.player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      (@board.cells[win_combo[0]] == "X" && @board.cells[win_combo[1]] == "X" && @board.cells[win_combo[2]] == "X") || (@board.cells[win_combo[0]] == "O" && @board.cells[win_combo[1]] == "O" && @board.cells[win_combo[2]] == "O")
    end
  end

  def draw?
    @board.full? && won? == (false || nil)
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      @board.cells[won?[0]]
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = self.current_player.move(input)
    player = self.current_player
    if self.board.valid_move?(input)
      self.board.update(input, player)
      self.board.display
    else
      turn
    end
  end

  def play
  end

end
