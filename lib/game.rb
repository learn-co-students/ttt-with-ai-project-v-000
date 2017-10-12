class Game
  #represents a singular instance of tic-tac-toe session
  attr_accessor :board
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    #@player_1 = player1
    #@player_2 = player_2
  end

  def board
      puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]


  def current_player
  end

  def won?
  end

  def winner
  end

  def start
  end

  def play
  end

  def turn
  end
end
