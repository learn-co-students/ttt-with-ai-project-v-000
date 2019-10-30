class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  CORNERS = [0,2,6,8]
  CENTER = 4

  def initialize(player_1=nil, player_2=nil, board=nil)
    @board = board ||= Board.new
    @player_1 = player_1 ||= Players::Human.new("X")
    @player_2 = player_2 ||= Players::Human.new("O")
  end

  def current_player
    board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def full?
    !board.cells.any? { |x| x == " " }
  end

  def over?
    self.draw? || self.won?
  end

  def won?
    win = WIN_COMBINATIONS.detect do |combo|
      win_combo = []
      combo.map do |el|
        win_combo << board.cells[el]
      end
      win_combo.uniq.length == 1 && win_combo.first != " "
    end
    win
  end

  def draw?
    self.full? && !self.won?
  end

  def winner
    if self.over? && self.won?
      winner = board.cells[self.won?.last]
    end
    winner == " " ? winner = nil : winner
  end

  def turn
    #checks the input, returns invalid if invalid and calls the gets again if necessary
    #changes the player
    current_player = @board.turn_count.even? ? player_1 : player_2
    user_input = self.current_player.move(@board.cells)
    if @board.valid_move?(user_input)
      @board.update(user_input, current_player)
    else
      user_input = self.current_player.move(@board.cells)
    end
    @board.display
  end

  def play
    if !self.over?
      self.turn
      self.play
    else
      if self.draw?
        puts "Cat's Game!"
      elsif self.won?
        puts "Congratulations #{self.winner}!"
      end
    end
  end
end
