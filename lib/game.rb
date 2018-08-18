class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2],
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if board.turn_count % 2 == 0
      return @player_1
    else return @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |wc|
      ar = [@board.cells[wc[0]], @board.cells[wc[1]], @board.cells[wc[2]]]
      return wc if ar.uniq.length == 1
    end
    return false
  end

  def draw?
    self.won? == false && @board.full? == true ? true : false
  end

  def over?
    self.won? || self.draw? ? true : false
  end

  def winner
    win = @board.cells[self.won?[0]]
    if win == "X" || win == "O"
      return win
    else
      return nil
    end
  end



end
