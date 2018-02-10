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
    won? || draw?
  end
  def won?
    WIN_COMBINATIONS.each do |wcombo|
      a = [ @board.cells[wcombo[0]], @board.cells[wcombo[1]], @board.cells[wcombo[2]] ]
      if a == [ "X", "X", "X" ]
        return wcombo
      end
    end
    WIN_COMBINATIONS.each do |wcombo|
      a = [ @board.cells[wcombo[0]], @board.cells[wcombo[1]], @board.cells[wcombo[2]] ]
      if a == [ "O", "O", "O" ]
        return wcombo
      end
    end
    return nil
  end
  def draw?
    @board.full? && !won?
  end
  def winner
    a = won?
    if a == nil
      return a
    else
      self.board.cells[a[0]]
    end
  end
  def turn
    a = current_player.move(@board)
    if self.board.valid_move?(a)
      self.board.update(a, current_player)
    else
      current_player.move(@board)
    end
  end
  def play
    while !over?
      turn
    end
    if won?
      return puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
