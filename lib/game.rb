require 'pry'
class Game
attr_accessor :board, :player_1, :player_2

    def initialize(player_1= Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
      @board=board || Array.new(9, " ")
      @player_1=player_1
      @player_2=player_2
    end #end of initialize

   WIN_COMBINATIONS=[
     [0,1,2], #top horizontal win
     [3,4,5], #Middle horizontal win
     [6,7,8], #Bottomr horizontal win
     [0,3,6], #Left Vert win
     [1,4,7], #Middle Vert win
     [2,5,8], #Right Vert Win
     [0,4,8], #Diagonal win
     [2,4,6] #Diagonal win
     ]

     def current_player
        @board.turn_count.even? ? @player_1 : @player_2
      end #end of current_player

def over?
won? || draw?
end #end of over?

def draw?(board)
(full?(board) && !won?(board))
end #end of draw?


def won?
WIN_COMBINATIONS.detect do |array|
  @board.cells[array[0]] == @board.cells[array[1]] && @board.cells[array[1]] == @board.cells[array[2]] && @board.taken?(array[0]+1)
end #end of iterator
  end #end of won?

def draw?
  !won? && @board.full?
end #end of draw?

def winner
  if won?
    @winner = board.cells[won?.first]
  end #end of if won?

end #end of winner

def turn_count(board)
   turn = 0
    board.each do |unit|
      if unit.even? == @player_1 || unit.odd? == @player_2
 turn +=1
 end
 end
 return turn
 end #end of turn_count

def turn
  player = current_player
  current_move = player.move(@board)
  if !@board.valid_move?(current_move)
    turn
  else
    @board.update(current_move, player)
    @board.display
  end #end of if/else
end #end of turn

def play
turn until over?
if draw?
puts  "Cat's Game!"
elsif won?
  puts "Congratulations #{winner}!"
end #end of if draw?
end #end of play

def play_again?
  puts "Would you like to play again?"
  input = gets.strip
  if input.downcase == "y" || input.downcase == "yes"
new_game
elsif input.downcase == "n" || input.downcase == "no"
exit
  end #end of if
end #end of play_again?



def start_0(player_1, player_2)
  @board.display
  @player_1= Players::Computer.new("X")
  @player_2= Players::Computer.new("O")
  play
end #end of start_0

def start_1(player_1, player_2)
puts "Do you want to go first?"
input_1 = gets.strip
if input_1 == "yes" || input_1 == "y"
@board.display
    @player_1= Players::Human.new("X")
    @player_2= Players::Computer.new("O")
  elsif input_1 == "no" || input_1 == "n"
@board.display
      @player_1= Players::Computer.new("X")
      @player_2= Players::Human.new("O")
end #end of if
  play
end #end of start_1


def start_2(player_1, player_2)
@board.display
@player_1= Players::Human.new("X")
@player_2=Players::Human.new("O")
play
end #end of start_2

end #end of Class Game
