require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O") , board = Board.new)
    @board =  board
    @player_1 = player_1
    @player_2 = player_2
  end
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [6,4,2],
    [2,5,8],
    [0,3,6],
    [1,4,7]
  ]
  def current_player
    if board.turn_count%2 == 0
     @player_1
    else
     @player_2
    end
  end
  def won?
     WIN_COMBINATIONS.detect{|win| board.cells[win[0]] ==  board.cells[win[1]] && board.cells[win[1]] ==  board.cells[win[2]] && board.taken?(win[2]+1)}
  end
  def draw?
       board.full? && !won?
  end
  def over?
    draw? || won?
  end
  def winner
    if won?
      board.cells[won?[0]]
    else
      return nil
    end
  end
  def turn
    if board.valid_move?(player_1.move(num))
      player_1.move(num)
    end
  end
end
