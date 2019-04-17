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
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combonation|
      @board.cells[combonation[0]] == @board.cells[combonation[1]] &&
      @board.cells[combonation[1]] == @board.cells[combonation[2]] &&
      @board.taken?(combonation[0]+1)
    end
  end

  def draw?
    @board.full? && !(self.won?)
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    self.won?.nil? ? nil : @board.cells[self.won?[0]]
  end

  def turn
    x = self.current_player.move(@board)
    if @board.valid_move?(x)
      @board.update(x, self.current_player)
      @board.display
    else
      puts "#{x}: Move not valid; please try again:"
      self.turn
    end
  end

  def play
    until self.over?
      self.turn
    end

    if self.won?
      puts "Congratulations #{self.winner}!"
    else
      puts "Cats Game!"
    end
  end
end
