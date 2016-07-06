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
WIN_COMBINATIONS.each do |combination| 
  pos1 = @board.position(combination[0])
  pos2 = @board.position(combination[1])
  pos3 = @board.position(combination[2])

 if (((pos1 == pos2) && (pos2 == pos3)) && (@board.taken?(pos1)))
  return combination
  #binding.pry
else
  false
end 
end
return false   
end

def draw? 
  if won? == false && @board.full? == true
    true
  else 
    false
  end
end 


def winner
  if won? == false 
    nil 
  else 
  @board.cells[(self.won?.first)]
  #binding.pry
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  if @board.valid_move?(input)
    @board.move(input, @board.current_player)
    @board.display
  else
    self.turn
end
end

def play 
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


