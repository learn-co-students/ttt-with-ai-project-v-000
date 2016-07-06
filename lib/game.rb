require_relative 'player.rb'
require_relative './players/human.rb'
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
    [6,2,4]
  ]


def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  @board = board
  @player_1 = player_1
  @player_2 = player_2

end 

def current_player 
num = @board.turn_count % 2 
if num == 0 
  player_1
else 
  player_2
end
end

def over? 
won? || draw?
end


def won?
WIN_COMBINATIONS.detect do |combination| 
  pos1 = @board.position(combination[0]+1)
  pos2 = @board.position(combination[1]+1)
  pos3 = @board.position(combination[2]+1)

(((pos1 == pos2) && (pos2 == pos3)) && (@board.taken?(combination[0]+1)))
end   
end

def draw? 
  !won? && @board.full?
end 


def winner
  if won? == nil
    nil 
  else 
  @board.cells[(self.won?.first)]
  end
end

def turn
  player = current_player
  current_move = player.move(@board)
  if @board.valid_move?(current_move)
    @board.display
    @board.update(current_move, player)
    @board.display 
  else
    turn
end
end

def play 
  while !(over?)
    turn
  end
  if won? 
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!" 
  end
end

end


#def winner
#  if won? == false 
#    nil 
#  elsif player_1 == current_player
#    player_2.token
#  elsif player_2 == current_player
#    player_1.token
# end
#end


