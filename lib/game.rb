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
    [2,4,6]
    ]

  def initialize(player_1=Player::Human.new("X"), player_2=Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      combo.all? {|position| @board.cells[position] == 'X'} || combo.all? {|position| @board.cells[position] == 'O'}
    end
  end

  def over?
    won? || draw?
  end

  def draw?
    board.full? && !won?
  end

  def winner
    WIN_COMBINATIONS.detect do |win_combination|
      if win_combination.all? {|location| @board.cells[location] == "X" }
        return "X"
      elsif win_combination.all? {|location| @board.cells[location] == "O" }
        return "O"
      end
    end
  end

  def turn
    choice = current_player.move(board)
    @board.valid_move?(choice) ? @board.update(choice, current_player) : turn
  end

  def play
     until over?
      turn
    @board.display
    end
    puts "Congratulations #{winner}!" if won?
    puts "Cats Game!" if draw?
  end
end