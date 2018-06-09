
class Game
  include Players

  attr_accessor :player_1, :player_2, :board, :invalid_moves
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize(p1 = Human.new('X'), p2 = Human.new('O'), board = Board.new)
    self.player_1 = p1
    self.player_2 = p2
    self.board = board

    self.invalid_moves = 0
  end

  def self.win_combinations
    WIN_COMBINATIONS
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    self.class.win_combinations.detect { |set|
      board.cells[set[0]] != ' ' && board.cells[set[0]] == board.cells[set[1]] && board.cells[set[1]] == board.cells[set[2]]
    }.tap { |result| return false unless result }
  end

  def draw?
    won? == false && board.full?
  end

  def over?
    won? != false || draw?
  end

  def winner
    board.cells[won[0]] if won = won?
  end

  def turn
    pl = current_player
    choice = pl.move(board)
    if board.valid_move?(choice)
      board.update(choice, pl)
      board.display
    else
      self.invalid_moves = self.invalid_moves + 1
      puts "invalid move"
      self.invalid_moves < 11 ? turn : exit
    end
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end

end
