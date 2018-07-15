require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [2,5,8],
    [1,4,7],
    [0,4,8],
    [6,4,2]
  ]

  #def board
  #  @board
  #end
  def initialize(player_1 = Player.new("X"), player_2 = Player.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if board.turn_count.even?
      token = "X"
    elsif board.turn_count.odd?
      token = "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]] &&
      (board.cells[combo[0]] == "X" || board.cells[combo[0]] == "O")
      return combo
      end
    end
    false
  end

  def draw?
    !won? && board.full?
  end



end
