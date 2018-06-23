require 'pry'
class Game

  attr_accessor :player_1, :player_2, :board

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

  def initialize(player_1=Player::Human.new("X"), player_2=Player::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    draw? || won?
  end

  def draw?
    @board.full? && !won?
  end

  def won?
    WIN_COMBINATIONS.detect do |array|
      array.all?{|i| @board.cells[i]=="X"} || array.all?{|i| @board.cells[i]=="O"}
      end
  end

  def winner
      board.cells[won?[0]] if won?
  end

  def turn
    move = current_player.move(@board)
    @board.valid_move?(move) ? @board.update(move, current_player) : turn
  end

  def play
     while !over?
       turn
       board.display
     end
    puts "Congratulations #{winner}!" if won?
    puts "Cats Game!" if draw?
  end



end
