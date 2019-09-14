require 'pry'

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

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    current_player = @board.turn_count.even? ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |win_index|
      @board.taken?(win_index[0]+1) &&
      @board.cells[win_index[0]] == @board.cells[win_index[1]] &&
      @board.cells[win_index[1]] == @board.cells[win_index[2]]
    end
  end

  def draw?
    !won? && @board.full?
  end

  def winner
    if won?
      @board.cells[won?[0]]
    end
  end

  def turn
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
    else
      turn
    end
  end

  def play
    turn until over?
    if won?
      @board.display
      puts "Congratulations #{self.winner}!"
    else
      @board.display
      puts "Cat's Game!"
    end
    #binding.pry
  end

end
