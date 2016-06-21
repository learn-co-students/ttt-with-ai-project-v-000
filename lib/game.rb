class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2], #Top Row
    [3, 4, 5], #Middle Row
    [6, 7, 8], #Bottom Row

    [0, 3, 6], #Left Column
    [1, 4, 7], #Middle Column
    [2, 5, 8], #Right Column

    [0, 4, 8], #Diagonal 1
    [6, 4, 2] #Diagonal 2
  ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    win? || draw?
  end

end # => Game Class