class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]

]

  def self.win_combinations
    WIN_COMBINATIONS
  end

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end

  def over?
    self.won? || self.draw?
  end

  def won?
    self.class.win_combinations.find do |combo_ary|
      self.board.cells[combo_ary[0]] == self.board.cells[combo_ary[1]] &&
      self.board.cells[combo_ary[1]] == self.board.cells[combo_ary[2]] &&
      self.board.taken?(combo_ary[0] + 1)
    end
  end

  def draw?
    self.board.full? && !won?
  end

  def winner
    self.board.cells[self.won?[0]] if self.won?
  end

  def turn
    input = self.current_player.move(self.board)
    if self.board.valid_move?(input)
      self.board.update(input, self.current_player)
      self.board.display
    else
      self.turn
    end
  end

  def play
    while !over?
      self.turn
    end
    if self.won?
      puts "Congratulations #{winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end
end
