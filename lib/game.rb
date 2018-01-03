class Game

  include Players

  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
    [board.cells[0], board.cells[1], board.cells[2]],
    [board.cells[3], board.cells[4], board.cells[5]],
    [board.cells[6], board.cells[7], board.cells[8]],
    [board.cells[0], board.cells[4], board.cells[8]],
    [board.cells[2], board.cells[4], board.cells[6]],
    [board.cells[0], board.cells[3], board.cells[6]],
    [board.cells[1], board.cells[4], board.cells[7]],
    [board.cells[2], board.cells[5], board.cells[8]]
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

      position_1 == position_2 && position_2 == position_3

    end

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
  end

  def play
  end

  def turn
    #I AM A COMMENT!!!!!
  end

end
