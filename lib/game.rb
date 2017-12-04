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
  [6,4,2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    self.board.turn_count.even? ? player_1 : player_2
  end

  def over?
    self.won? || self.draw? || self.board.full?
  end

  def won?
    WIN_COMBINATIONS.any? do |combination|
      return combination if (self.board.taken?(combination[0] + 1)) && (self.board.position(combination[0] + 1) == self.board.position(combination[1] + 1)) && (self.board.position(combination[1] + 1) == self.board.position(combination[2] + 1))
    end
  end

  def draw?
    !self.won? && self.board.full?
  end

  def winner
    win_combination = self.won?
    if win_combination
      return self.board.position(win_combination[0]+1)
    else
      return nil
    end
  end

  def turn
    move = self.current_player.move(self.board)
    if self.board.valid_move?(move)
      self.board.update(move, self.current_player)
      self.board.display
    else
      self.turn
    end
  end

  def play
    while !self.over?
      puts "Please enter a number 1-9:"
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end


end
