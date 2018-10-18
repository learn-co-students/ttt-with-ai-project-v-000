class Game
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
  ]

  attr_accessor :player_1, :player_2, :board


  def initialize(player_1=Players::Human.new("X"),
    player_2=Players::Human.new("O"), board=Board.new)

    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

  def current_player
    if board.turn_count.even?
      self.player_1
    else self.player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      binding.pry
    board.cells

  end

  def draw?


  end

  def over?

  end

  def winner

  end

end
