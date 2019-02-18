require 'pry'

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if @board.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
  end

  def won?
  WIN_COMBINATIONS.detect do |win_combo|
    @board.taken?(win_combo[0] + 1) && @board.cells[win_combo[0]] == @board.cells[win_combo[1]] && @board.cells[win_combo[1]] == @board.cells[win_combo[2]]

  end

end

def draw?
  @board.full? && !self.won?
end

  def over?
    self.draw? || self.won?
  end

  def winner
    if self.won?

      @board.cells[self.won?[0]]
    else
      nil
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = self.current_player.move(input)
    index = input.to_i - 1
    if @board.valid_move?(input)
      @board.cells[index] = self.current_player.token
    else
      turn
    end
  end



  def play
    until self.over?
      turn
    end
    if won?
      puts "Congratulations #{self.winner}!"
    else
      puts "Cat's Game!"
    end
  end


end
