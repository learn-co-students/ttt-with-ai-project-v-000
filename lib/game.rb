class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [2, 4, 6],
    [0, 4, 8]
  ]
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  def current_player
    self.board.cells.count{|cell| cell = "X" || cell = "O"}.odd? ? self.player_1 : self.player_2
  end
  def over?
    self.draw? || self.won?
  end
  def won?
    WIN_COMBINATIONS.detect do |combo|
      self.board.taken?(combo[0]) && self.board.cells[combo[0]] == self.board.cells[combo[1]] && self.board.cells[combo[1]] == self.board.cells[combo[2]]
    end
  end
  def draw?
    self.board.full? && !self.won?
  end
  def winner
    if self.won?
      if self.board.cells[self.won?[0]] == "X"
        "X"
      elsif self.board.cells[self.won?[0]] == "O"
        "O"
      end
    end
  end
  def turn
    puts "Enter a number between(1-9):"
    user_input = current_player.move(board)
    if board.valid_move?(user_input)
      board.update(user_input, current_player)
      board.display
    else
      puts "Invalid move"
      turn
    end
  end
  def play
    # turn
    # over?
  end
end

