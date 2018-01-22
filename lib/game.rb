class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]

  def initialize( player_1 = Players::Human.new("X"),
                  player_2 = Players::Human.new("O"),
                  board = Board.new                   )
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def play
    self.board.display

    while !self.over?
      self.turn
    end

    if self.won?
      puts "Congratulations #{self.winner}!"
      puts "You won by going in spots #{self.won?.inspect}"
    else
      puts "Cat's Game!"
    end
  end

  def turn
    this_move = self.current_player.move(self.board)

    if !self.board.valid_move?(this_move)
      puts "\nThat is not a valid move. Please try again!\n\n\n"
      self.turn
    else
      puts "\n#{self.current_player.token} went in spot #{this_move}.\n\n\n"
      self.board.update(this_move, self.current_player)
    end

    self.board.display
  end

  def current_player
    self.board.turn_count.even? ? player_1 : player_2
  end

  def over?
    self.won? || self.draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      self.board.cells[combo[0]] != " " &&
      self.board.cells[combo[0]] == self.board.cells[combo[1]] &&
      self.board.cells[combo[1]] == self.board.cells[combo[2]]
    end
  end

  def winner
    self.won? ? self.board.cells[self.won?[0]] : nil
  end

  def draw?
    !self.won? && self.board.full?
  end

end
