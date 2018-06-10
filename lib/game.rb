
class Game
  include Players

  # remove invalid_moves after AI is done
  attr_accessor :player_1, :player_2, :board, :invalid_moves
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize(p1 = Human.new('X'), p2 = Human.new('O'), board = Board.new)
    self.player_1 = p1
    self.player_2 = p2
    self.board = board
    # remove invalid_moves after AI is done
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
      board.cells[set[0]] != ' ' &&
      board.cells[set[0]] == board.cells[set[1]] &&
      board.cells[set[1]] == board.cells[set[2]]
    }.tap { |result|
      return false unless result
    }
  end

  def draw?
    !won? && board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    if combo = won? then board.cells[combo[0]] end
  end

  def turn
    choice = current_player.move(board)
    if board.valid_move?(choice)
      board.update(choice, current_player)
      board.display
    else
      # remove invalid_moves after AI is done
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
