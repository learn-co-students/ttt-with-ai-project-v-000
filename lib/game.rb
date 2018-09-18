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

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

  def current_player
    self.board.turn_count.even? ? self.player_1 : self.player_2
  end

  def over?
    self.won? || self.draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      combination.all? {|index| self.board.cells[index] == self.board.cells[combination[0]] && self.board.taken?(index+1)}
    end
  end

  def draw?
    !self.won? && self.board.full?
  end

  def winner
    self.board.cells[won?.first] if won?
  end

  def turn
    self.board.display
    puts "Please enter 1-9, player #{self.current_player.token}"

    input = self.current_player.move(self.board)
    if self.board.valid_move?(input)
      self.board.update(input, self.current_player)
    else
      puts 'Invalid Input or spot taken! Enter again!'
      self.turn
    end

  end

  def play

    until self.over?
      self.turn
    end
    self.board.display
    if winner
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
