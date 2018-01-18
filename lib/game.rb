require 'pry'
class Game
#  include Players::Human
  attr_accessor :board, :player_1, :player_2, :token

  WIN_COMBINATIONS = [
    [0,1,2],  #Top row
    [3,4,5],  #Middle row
    [6,7,8],  #Bottom row
    [0,3,6],  #First column
    [1,4,7],  #Second column
    [2,5,8],  #Third column
    [0,4,8],  #First diagonal
    [2,4,6],  #Second diagonal
  ]
## How does that work ?? - arguments? without including modules?
  def initialize(player_1 = Players::Human.new("X") , player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end


  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |winning_combination|
      position_1 = @board.cells[winning_combination[0]]
      position_2 = @board.cells[winning_combination[1]]
      position_3 = @board.cells[winning_combination[2]]
      position_1 == position_2 && position_2 == position_3 && position_1 != " "
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if won = won?
      board.cells[won.first]
    end
  end

  def turn
      player = current_player
      input = player.move(@board)   ###
      if @board.valid_move?(input)
        @board.update(input, current_player)
        @board.display
      else
        turn
      end
    end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end


end
