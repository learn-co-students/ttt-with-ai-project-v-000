require 'pry'
class Game

attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], #lower row
  [0,4,8], #horizontal row_a
  [2,4,6], #horizontal_row_b
  [1,4,7], #vertical_row_a
  [0,3,6], #vertical_row_b
  [2,5,8], #vertical_row_c
  ]

def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
@board = board
@player_1 = player_1
@player_2 = player_2
end

def current_player
  if @board.turn_count % 2 == 0
    return player_1
  else
    return player_2
  end
end


  def over?
  won? || draw?
end

def full?
 if @board.cells.include?(' ') || @board.cells.include?('')
   return false
else
   return true
 end
end

def won?
WIN_COMBINATIONS.detect do |combo|
@board.cells[combo[0]] == @board.cells[combo[1]] &&
@board.cells[combo[1]] == @board.cells[combo[2]] && ( @board.cells[combo[0]] == "X" || @board.cells[combo[0]] == "O")
    end #end def
  end



def winner
if won?
combo = won?
@board.cells[combo[0]]
end
end


def draw?
 if !won? && full?
   return true
 end
end

def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
    turn
  elsif @board.valid_move?(current_move)
  @board.update(current_move, player)
  end
end


def play
turn until over?
   if won?

     puts "Congratulations #{winner}!"
  elsif draw?
  puts "Cat's Game!"

     puts "Congratulations #{winner}"
  elsif draw?
  puts "There has been a draw"

   end
 end

def start
  puts "Welcome to Tic Tac Toe!"
  puts "What player would you like to be? X or O?"
  player.token = gets.chomp
  puts "Who should go first and be X ?"
  player = Player.new(token)
  game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  game
  game.over?
  puts "Would you like to play again?"
  answer = gets.chomp
  if answer == "Yes"
    start
    game
  else
    end
  end




end
