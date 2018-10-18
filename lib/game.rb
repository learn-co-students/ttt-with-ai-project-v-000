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
    xa = []
    oa = []
    board.cells.each_with_index{|v,i|
      v == "X" ? xa << i : oa << i}

    WIN_COMBINATIONS.detect {|combo|
      combo & xa == combo || oa & combo == combo}
  end

  def draw?
    self.won? == nil ? true : false
  end

  def over?
    if draw? == true
      true
    elsif won? != nil
      true
    end

  end

  def winner
    if won? && current_player.token == "O"
      "O"
    elsif won? && current_player.token == "X"
      "X"
    else nil

    end
  end
end
