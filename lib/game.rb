require "pry"
class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8],[6,4,2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    turn_count % 2 == 0 ? player_1 : player_2
  end

  def turn_count
      self.board.cells.count {|index| index != " "}
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      self.board.cells[win_combo[0]] == self.board.cells[win_combo[1]] &&
      self.board.cells[win_combo[2]] == self.board.cells[win_combo[0]] &&
      self.board.cells[win_combo[0]] != " "
    end
  end

  def draw?
    if self.board.full? && !won?
      return true
    else
      return false
    end
  end

  def over?
    won? || draw?
  end

  def winner
    winning_array = won?
    self.board.cells[winning_array[0]] if winning_array != nil
  end

  def turn
    puts "Please input your move"
    board.display
    input = self.current_player.move(self.board)
    if self.board.valid_move?(input)
      self.board.cells[input.to_i - 1] = current_player.token
    else
      turn
    end

  end

  def play
    while !(self.over?)
      sleep 0.5
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
      board.display
    elsif draw?
      puts "Cat's Game!"
      board.display
    end
  end

end
