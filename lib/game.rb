class Game
attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  #Last row
    [0,4,8],  # Top left to bottom right
    [2,4,6],  # Top right to bottom left
    [0,3,6],  # First Column
    [1,4,7],  #Middle column
    [2,5,8] # 3rd column
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player

    if board.turn_count.even?
      player_1
    else
      player_2
    end

  end

  def won?

    WIN_COMBINATIONS.detect do |combination|

      @board.cells[combination[0]] == @board.cells[combination[1]] &&
      @board.cells[combination[0]] == @board.cells[combination[2]] &&
      @board.taken?(combination[0] + 1)

    end

  end

  def draw?

    !won? && @board.full?

  end

  def over?

    draw? || won?

  end

  def winner

    if winner_board = won?
    @winner = @board.cells[winner_board.first]
    end

  end

end
