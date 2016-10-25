class Game
  attr_accessor :board, :player_1, :player_2
  attr_reader :token_win, :counter

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @counter = 0
  end

  def current_player
    self.board.turn_count.even? ? self.player_1 : self.player_2
  end



  def draw?
    self.board.full? && !self.won? ? true : false
  end

  def won?
    WIN_COMBINATIONS.each do |e|
      if e.all? { |pos| self.board.position(pos + 1) == self.player_1.token} || e.all? { |pos| self.board.position(pos + 1) == self.player_2.token}
        @token_win = self.board.cells[e[0]]
        return true
      end
    end
    false
  end

  def over?
    self.won? || self.draw? ? true : false
  end

  def winner
    self.won? ? self.token_win == "X" ? self.player_1.token : self.player_2.token : nil
  end

  def turn
    pos = self.current_player.move(self.board)
    if self.board.valid_move?(pos)
      self.board.update(pos, self.current_player)
      self.board.display
    else
      turn
    end
  end

  def play
    until self.over?
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cats Game!"
      @counter += 1
    end
  end

end
