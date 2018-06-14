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
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
  @board.turn_count % 2 == 0 ? @player_1 : @player_1
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      combo.all? { |spot| self.board.cells[spot] == self.board.cells[combo[0]] && self.board.taken?(spot + 1)}
    end
  end

  def draw?
    self.board.full? && !won?
  end

  def over?
    won? || self.board.full?
  end

  def winner
    won? ? self.board.cells[won?[0]] : nil
  end

  def turn
    self.board.display
    puts "enter 1-9, #{self.current_player.token}"
    spot = self.current_player.move(self.board)
      if self.board.valid_move?(spot)
        self.board.update(spot, self.current_player)
      else
        puts "make a real move tho"
        self.turn
      end
    end

end
