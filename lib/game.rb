class Game

  attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #left column
    [1, 4, 7], #middle column
    [2, 5, 8], #right column
    [0, 4, 8], #down diagonal
    [6, 4, 2]  #up diagonal
  ]

  def initialize(player_1 = nil, player_2 = nil, board = nil)
    if player_1 == nil && player_2 == nil && board == nil
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Human.new("O")
      @board = Board.new
    else
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end
  end

  def current_player
    if @board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
    #binding.pry
  end

  def over?
    
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      binding.pry
    end
  end

  def draw?

  end


end
