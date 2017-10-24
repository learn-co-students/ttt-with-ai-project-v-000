class Game
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  attr_accessor :board, :player_1, :player_2, :winning_combo

  @@draw_count = 0

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def draw?
    @board.full?
  end

  def self.draw_count
    @@draw_count
  end

  def self.draw_count=(draw_count)
    @@draw_count = draw_count
  end

  def over?
    if self.won? || self.draw?
      true
    else
      false
    end
  end

  def turn
    m = self.current_player.move(@board)

    if @board.valid_move?(m)
      @board.update(m, self.current_player)
      @board.display
      puts "#{self.current_player.token}'s turn"
    else
      self.turn
    end
  end

  def play
    @board.reset!
    while self.over? == false
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
      if "X" == self.winner
        @player_1.win_count = @player_1.win_count + 1
      else
        @player_2.win_count = @player_2.win_count + 1
      end
    elsif self.draw?
      puts "Cats Game!"
      @@draw_count += 1
    end
  end

  def winner
    if self.won?
      self.current_player == @player_1 ? "O" : "X"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[0]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0] + 1)
    end
  end

end
