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

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.find do |win|
      @board.cells[win[0]] == @board.cells[win[1]] &&
      @board.cells[win[1]] == @board.cells[win[2]] &&
      @board.taken?(win[0]+1)
    end
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    draw? || won?
  end

  def winner
    if winning_combo = won?
    @board.cells[winning_combo[0]]
    end
    #binding.pry
  end

  def turn
    @board.display if @board.turn_count == 0
    current_move = current_player.move(@board)
    if !@board.valid_move?(current_move)
      puts "\nInvalid move, please try again."
      @board.display
      puts "\n"
      turn
    else
      puts "\n#{current_player.token} moved to #{current_move}."
      @board.update(current_move, current_player)
      @board.display
      puts "\n"
    end
  end

  def play
    until over?
     turn
    end
    if won?
     puts "Congratulations #{winner}!"
     sleep 0.5
    elsif draw?
     puts "Cat's Game!" #I still have no idea what this 'Cat's Game is
     sleep 0.5
    end
  end

end
