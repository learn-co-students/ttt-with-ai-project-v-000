
class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], #top row horizontal, WIN_COMBINATIONS[0] IN OTHER WORDS THIS IS THE SAME AS COMBO[0]
    [3,4,5], #middle row horizontal COMBO[0] == 3
    [6,7,8], #bottom row horizontal
    [0,3,6], #left-side vertical
    [1,4,7], #middle vertical
    [2,5,8], #right-side vertical
    [2,4,6], #diagonal win 1
    [0,4,8], #diagonal win 2
  ]

  def initialize(player_1 = nil, player_2 = nil, board = nil)
    @player_1 = player_1 || Players::Human.new("X")
    @player_2 = player_2 || Players::Human.new("O")
    @board = board || Board.new
    #binding.pry
  end

  def current_player
    if @board.turn_count.odd?
      @player_2
    else
      @player_1
    end
  end

  def over?
    if board.cells == WIN_COMBINATIONS #Somehow, I need to convert these arrays into a recognizable source of data to the game.
      false
    elsif (@board.cells.any? == " " || "") && != WIN_COMBINATIONS
      false
    else
      true
    end
  end


end
