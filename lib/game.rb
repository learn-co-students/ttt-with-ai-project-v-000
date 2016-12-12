require 'pry'
class Game

attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [2,4,6],
   [0,4,8],
   [0,3,6],
   [1,4,7],
   [2,5,8]
]


def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
@player_1 = player_1
@player_2 = player_2
@board = board
end


def current_player
  turns = @board.cells.select {|piece| piece == "X" || piece == "O"}
  if turns.count % 2 == 0
  player_1
else
   player_2
end
end

def over?
 draw? || won?
end

def won?
   WIN_COMBINATIONS.detect do |combination|
     @board.cells[combination[0]] == @board.cells[combination[1]] && @board.cells[combination[1]]== @board.cells[combination[2]] && @board.cells[combination[0]] != " "
end
end

def draw?
 @board.full? && !won?
end

def winner
  @board.cells[won?[0]] if won?
end

def turn


  place = current_player.move(@board)
  if @board.valid_move?(place)
    @board.update(place, current_player)
    @board.display
else
  turn
end
end

def play
  @board.display
while !over?
  turn
 end
if won?
    puts "Congratulations #{winner}!"
  elsif
    puts "Cats Game!"
  end
end




end
