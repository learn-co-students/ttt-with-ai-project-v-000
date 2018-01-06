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
    won? == nil && self.board.full? == true ? true : false
  end

  def won?
    @cells = self.board.cells
    result = WIN_COMBINATIONS.find_all do |win_index|

      position_1 = @cells[win_index[0]]
      position_2 = @cells[win_index[1]]
      position_3 = @cells[win_index[2]]

      position_1 == "X" && position_2 == "X" && position_3 == "X" ||
      position_1 == "O" && position_2 == "O" && position_3 == "O"
    end
    result.last
  end

  def over?
    if won? !=nil
      true
    elsif
      draw? == true
      true
    end
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
