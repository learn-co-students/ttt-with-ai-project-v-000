class Game

  include Players

  attr_accessor :player_1, :player_2, :players, :board

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.odd? ? @player_2 : @player_1
  end

  def draw?
    #board.full? == true && board.cells.count("X") == board.cells.count("O") ? true : false
  end

  def won?

    WIN_COMBINATIONS.each do |combo|

      position_1 = combo[0]
      position_2 = combo[1]
      position_3 = combo[2]

    end

     self.board.cells

  end

#  def over?
#    if won? == true
#      true
#    elsif
#      won? == false && draw == true
#      true
#    elsif

#  end

  def winner
  end

  def start
    #### WHAT IS GOING ON????????????
  end

  def play
    #######################ADFGVAERF AEGAERGAERG
  end

  def turn
    #I AM A COMMENT!!!!!
  end

end

#WIN_COMBINATIONS = [
#  [self.board.cells[0], self.board.cells[1], self.board.cells[2]],
#  [self.board.cells[3], self.board.cells[4], self.board.cells[5]],
#  [self.board.cells[6], self.board.cells[7], self.board.cells[8]],
#  [self.board.cells[0], self.board.cells[4], self.board.cells[8]],
#  [self.board.cells[2], self.board.cells[4], self.board.cells[6]],
#  [self.board.cells[0], self.board.cells[3], self.board.cells[6]],
#  [self.board.cells[1], self.board.cells[4], self.board.cells[7]],
#  [self.board.cells[2], self.board.cells[5], self.board.cells[8]]
#]
