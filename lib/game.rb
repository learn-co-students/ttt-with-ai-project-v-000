class Game

  attr_accessor = @player_1, @player_2, @board

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end


  def current_player

  end

  def won?

  end

  def winner

  end

  def start

  end

  def play

  end

  def turn

  end


end
