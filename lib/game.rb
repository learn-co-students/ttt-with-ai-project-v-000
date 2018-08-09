class Game

  #include Countable

  WIN_COMBINATIONS = [
   [0, 1, 2],
   [3, 4, 5],
   [6, 7, 8],
   [0, 3, 6],
   [1, 4, 7],
   [2, 5, 8],
   [0, 4, 8],
   [2, 4, 6]
  ]


  # attr_accessor :board
  attr_reader :player_1, :player_2, :board

   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
     @player_1 = player_1
     @player_2 = player_2
     @board = board
  end

  def player_1=(player_1)
    @player_1 = player_1
  end

  def player_2=(player_2)
    @player_2 = player_2
  end

  def board=(board)
    @board = board
  end

  def turn_count
    board.cells.count {|space| space != " "}
  end

  def current_player
    turn_count % 2 == 0 ? @player_1.token : @player_2.token
  end

end
