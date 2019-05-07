class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

  def board
    board = []
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end

  def initialize(player_1 = Player.new("X"), player_2 = Player.new("O"), board = Board.new)
    game = Game.new(player_1: player_1, player_2: player_2, board: board)
  end

  def current_player
    self.board.turn_count.even? ? player_1 : player_2
  end

  def won?
  end

  def draw?
  end

  def over?
    if self.board.full?
      return true
    else
      return false
    end
  end

  def winner
    if self.won?
      return "X"
    end
  end

  def turn
    input = gets.strip
    return "pople"
  end

  def play
    case
    when self.won?
      puts "Congratulations #{self.winner}!"
    when self.draw?
      puts "Cat's Game!"
    end
  end

end
