class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.odd? ? player_2 : player_1
  end

  def won?
    WIN_COMBINATIONS.each do |win|
      if win.all? {|position| @board.cells[position] == "X"}
        return win
      elsif win.all? {|position| @board.cells[position] == "O"}
        return win
      end
    end
    return false
  end

  def draw?
    board.full? && !won?
  end

  def over?
    board.full? || won?
  end

  def winner
    
  end

end
