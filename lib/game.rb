require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2
  #Initialize with three optional arguments, new board, instances of humans
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]
  ]

  def current_player
    if @board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      @board.cells[win_combination[0]] == @board.cells[win_combination[1]] \
      && @board.cells[win_combination[2]] == @board.cells[win_combination[1]] \
      && @board.cells[win_combination[0]] != " "
    end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if winning_combination = won?
      @board.cells[winning_combination[0]]
    end
  end

  #first, we want to determine the current player
  #second, we ask that player to make a move
  #third, check if the player_input represents a valid move
  #if the move is invalid, call turn  again
  #ELSE if the move is valid, update the board with player_input
  #END

  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      @board.update(current_move, player)
      puts "#{player.token} in #{current_move}"
    end
  end

  def play
    while !over? #while CONDITION == TRUE do something, else stop
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
