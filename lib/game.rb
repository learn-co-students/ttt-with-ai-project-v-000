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

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

  def current_player
    self.board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def turn
    player = self.current_player
    move = player.move(self.board)

    if self.board.valid_move?(move)
      self.board.update(move, player)
      self.board.display
      puts " "
      puts " "
    else
      self.turn
    end
  end

  def play

    while !self.over? && !self.won? && !self.draw?
      self.turn
    end

    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end

  end

  def won?
    WIN_COMBINATIONS.detect {|win_combo|
      self.board.position(win_combo[0]+1) == self.board.position(win_combo[1]+1) &&
      self.board.position(win_combo[1]+1) == self.board.position(win_combo[2]+1) &&
      self.board.taken?(win_combo.first+1)
    }
  end

  def winner
    if self.won?
      self.board.position(self.won?.first+1)
    end
  end

  def draw?
    !self.won? && self.board.full?
  end

  def over?
    self.board.full? || self.won?
  end

end
