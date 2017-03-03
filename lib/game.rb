class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  ::WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    match = ::WIN_COMBINATIONS.select do |w|
      w.all? { |i| @board.cells[i] == "X" } || w.all? { |i| @board.cells[i] == "O"}
    end

    if match == []
      match = nil
    else
      match = match[0]
    end
  end

  def draw?
    if !won? && @board.full?
      true
    else
      false
    end
  end

  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  def winner
    
  end
end
