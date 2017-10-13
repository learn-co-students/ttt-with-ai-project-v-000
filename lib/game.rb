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
    self.board.turn_count.even? ? self.player_1 : self.player_2
  end

  def over?
    true if self.draw? || self.won?
  end

  def draw?
    true if self.board.full? && !self.won?
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      win_combo.all?{|w| self.board.cells[w] == "X"} || win_combo.all?{|w| self.board.cells[w] == "O"}
    end
  end

  def winner
    self.board.cells[self.won?[0]] if self.won?
  end

  def turn
    player_move = self.current_player.move(board)
    if self.board.valid_move?(player_move)
      self.board.update(player_move, self.current_player)
    else
      puts "\n Please enter a valid board position (1-9).\n"
      self.turn
    end
  end

  def play
    self.board.display
    while !self.over?
      self.turn
      self.board.display
    end
    if self.won?
      puts "\nCongratulations #{self.winner}!\n"
    else
      puts "\nCat's Game!\n"
    end
  end
end
