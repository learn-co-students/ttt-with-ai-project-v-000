class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 4, 8],
      [6, 4, 2],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
  ]

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board    = board
  end

  def current_player
    self.board.turn_count.even? ? self.player_1 : self.player_2
  end

  def over?
    self.draw? || self.won?
  end

  def won?
    won = nil

    WIN_COMBINATIONS.each do |combo|
      if combo.all? { |cell| self.board.cells[cell] == 'X' } || combo.all? { |cell| self.board.cells[cell] == 'O' }
        won = combo
      end
    end

    won
  end

  def draw?
    self.board.full? && !self.won?
  end

  def winner
    self.board.cells[won?.first] if self.won?
  end

  def turn
    input = self.current_player.gets
    self.turn unless self.board.valid_move?(input)
    self.board.update(input, self.current_player)
  end

  def play
    until self.over?
      puts "#{self.current_player}, please enter 1-9"
      self.turn
    end
    puts "Congratulations #{self.winner}!" if self.won?
    puts "Cat's Game!" if self.draw?
  end
end