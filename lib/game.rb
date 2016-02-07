require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #left column
  [1,4,7], #Middle Column
  [2,5,8], #Right COlumn
  [0,4,8], #diagnonal 1
  [2,4,6]  #diagnonal 2
  ]

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    return won? || draw?
  end

  def won?
    WIN_COMBINATIONS.each do |entry|
      #Check that they are the same
      if all_equal?(entry) && @board.position(entry[1]+1) != " "
        return true
      end
    end
    return false
  end

  def all_equal?(entry)
    return @board.position(entry[0]+1) == @board.position(entry[1]+1) && @board.position(entry[1]+1) == @board.position(entry[2]+1)
  end

  def draw?
    return board.full? && !won?
  end

  def winner
    WIN_COMBINATIONS.each do |entry|
      #Check that they are the same
      if all_equal?(entry) && @board.position(entry[1]+1) != " "
        return @board.position(entry[1]+1)
      end
    end
    return nil
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      @board.update(current_move, player)
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end