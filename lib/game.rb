class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [2,5,8], [1,4,7], [0,4,8], [6,4,2]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    self.draw? || self.won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
    end
  end

  def draw?
    !board.cells.any? {|c| c == " "} && !self.won?
  end

  def winner
    if self.won?
      board.cells[self.won?[0]]
    else
      nil
    end
  end

  def turn
    current_move = current_player.move(@board)
    puts " "
    if @board.valid_move?(current_move)
      @board.update(current_move, current_player)
      board.display
      puts " "
    else
      turn
    end
  end

  def play
    turn until over?
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
    puts " "
  end

end
