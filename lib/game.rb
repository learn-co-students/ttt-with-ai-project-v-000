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
    [2, 4, 6]
  ]
  def initialize(one = Players::Human.new("X"), two = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = one
    @player_2 = two
  end
  def current_player
    if self.board.turn_count == 0
      return @player_1
    elsif self.board.turn_count % 2 != 0
      return @player_2
    else
      return @player_1
    end
  end
  def over?
    if self.board.turn_count == 9
      return true
    end
  end
  def won?
    WIN_COMBINATIONS.each_with_index do |wcombo|
      a = wcombo.collect {|space| self.board.cells[space]}
      if a.uniq.size == 1
        return wcombo
      end
    end
    return false
  end
  def draw?
    if won?
      return false
    elsif over?
      return true
    else
      binding.pry
      return true
    end
  end
  def winner
    a = won?
    self.board.cells[a[0]] == " " ? nil : self.board.cells[a[0]]
  end
  def turn
    binding.pry
    if self.board.valid_move?(self.current_player.move(@board))
      self.board.update(self.current_player.move(@board), current_player)
    end
  end
end
