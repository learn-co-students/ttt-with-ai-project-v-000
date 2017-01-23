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

  def board
    @board
  end

  def current_player
    if @board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      (@board.cells[combo[0]] == @board.cells[combo[1]]) && (@board.cells[combo[0]] == @board.cells[combo[2]]) &&
      @board.cells[combo[0]] != " "
    end
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      win = WIN_COMBINATIONS.detect {|combo|
        (@board.cells[combo[0]] == @board.cells[combo[1]]) && (@board.cells[combo[0]] == @board.cells[combo[2]]) &&
        @board.cells[combo[0]] != " "}
      @board.cells[win.first]
    end
  end

  def turn
    player = self.current_player
    move = player.move(@board)
    if @board.valid_move?(move)
      @board.update(move, player)
      @board.display
    else
      turn
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif
      draw?
      puts "Cat's Game!"
    end
  end


end
