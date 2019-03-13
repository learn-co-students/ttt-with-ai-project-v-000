require 'pry'
#require_relative "./players/computer.rb"
#require_relative "./players/human.rb"
#require_relative "./lib/player.rb"


class Game
  #extend Players::Human
  #extend Players::Computer
  
  WIN_COMBINATIONS = [
    
  [0,1,2], #top row 
  [3,4,5], #middle row 
  [0,4,8], #top left to lower right diagonal 
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [6,4,2], #bottom left to top right diagonal
  [6,7,8] #bottom row 
  
  ]
  
  game_type = 4

  while game_type != 3
  
  attr_accessor :board, :player_1, :player_2, :input  
  
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @board.display
    
    #When play, below, is uncommented, 
    #the CLI runs and plays through the game in 0,1, or 2 player mode 
    #When play is commented out, all tests pass 
    #play 
  end
 
  def current_player
   board.turn_count % 2 == 0 ? player_1 : player_2
   #binding.pry 
  end


#won?
  
def won?
  WIN_COMBINATIONS.each do |combo|
    if @board.cells[combo[0]] == @board.cells[combo[1]] &&
        @board.cells[combo[1]] == @board.cells[combo[2]] &&
        @board.taken?(combo[0]+1)
        return combo
    end
  end
  return false 
end
    
#full?

def full?
  @board.all?{|played| played != " "}
end

#draw?

def draw?
  board.full? && !won?
end 

#over?

def over?
  won? || draw? || board.full?
end

#winner

def winner
  if winner_array = won?
      @board.cells[winner_array[0]]
  end
end

#turn 

def turn
    @input = current_player.move(@board)
    if @board.valid_move?(@input)
      @board.update(@input, current_player)
    else puts "Please try again. This position is taken. Enter a number 1-9:"
      @board.display
      turn
    end
    @board.display
  end

#play 

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
   
 def self.start 
  
  puts "Would you like to play the game with 0, 1, or 2 players? Enter 0, 1, or 2. To exit, enter 3"
  
   game_type = gets.to_i

  #while game_type != 3

    if game_type == 0 
      Game.new(Players::Computer.new("X"), Players::Computer.new("O")) 
    elsif game_type == 1
      Game.new(Players::Human.new("X"), Players::Computer.new("O"))
    elsif game_type == 2  
      Game.new(Players::Human.new("X"), Players::Human.new("O"))
    else 
      puts "Incorrect choice.Please enter 0, 1, or 2."
    game_type = gets 
      end
    end
    game_type = 3
  end
end