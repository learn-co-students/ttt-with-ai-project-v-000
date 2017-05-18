class Game

  attr_accessor :board, :player1, :player2

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

  def initialize(player1 = Human.new("X"), player2 = Human.new("O"), board = Board.new)
    @player1 = player1
    @player2 = player2
    @board = board
  end

  def current_player
    if @board.turn_count % 2 == 0
      @player1
    else
      @player2
    end
  end

  def over?
    self.won? || self.draw?
  end

  def won?
    if WIN_COMBINATIONS.each do |array|
      array[0] == array[1] && array[1] == array[2]
      end
      true
    else
      false
    end
  end

  def draw?
    self.won? == false && @board.full? == true
  end

  def winner
    if self.won?
      
  end





end
