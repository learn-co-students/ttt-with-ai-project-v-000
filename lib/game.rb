class Game
  include Players

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],
                      [0,3,6],[1,4,7],[2,5,8],
                      [0,4,8],[2,4,6]]

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if board.cells.count(player_1.token) > board.cells.count(player_2.token)
      player_2
    else
      player_1
    end
  end

  def won?
    cells = board.cells
    win = WIN_COMBINATIONS.select do |x|
      cells[x[0]] != " " &&
      cells[x[0]] == cells[x[1]] &&
      cells[x[1]] == cells[x[2]]
    end
    win.length > 0
  end

  def draw?
    !won? && !(board.cells.include?(" "))
  end

  def over?
    won? || draw?
  end

end
