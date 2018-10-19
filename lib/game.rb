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
    board.turn_count.even? ? self.player_1 : self.player_2
  end

  def won?
    xa = []
    oa = []
    board.cells.each_with_index{|v,i|
      if v == "X"
        xa << i
      elsif v == "O"
        oa << i
      end}

    WIN_COMBINATIONS.detect {|combo|
      combo & xa == combo || oa & combo == combo}
  end

  def draw?
    won? == nil && board.full? == true ? true : false
  end

  def over?
    won? != nil || draw? == true ? true : false
  end

  def winner
    xa = []
    oa = []
    board.cells.each_with_index{|v,i|
      if v == "X"
        xa << i
      elsif v == "O"
        oa << i
      end}
    if WIN_COMBINATIONS.detect {|combo|
      combo & xa == combo}
      "X"
    elsif WIN_COMBINATIONS.detect {|combo|
      oa & combo == combo}
      "O"
    else nil
    end
  end

  def turn
    board.update(current_player.move(board), current_player)
  end

  def play

  end
end
