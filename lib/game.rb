class Game 
  
  attr_accessor :board, :player_1, :player_2 
  
  def initialize(board=nil, player_1=nil, player_2=nil)
    @board = board.display
    @player_1 = player_1
    @player_2 = player_2
  end
 
  def current_player
   board.turn_count % 2 == 0 ? player_1 : player_2
  end
 
  
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

#input to index 
def input_to_index(input)
  index = "#{input}".to_i - 1
end

#move
def move(index, char="X")
  @board[index] = char
end

#turn
def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  char = "#{current_player}"
  if valid_move?(index) == true
    move(index, char)
    puts display_board
  else
    puts "Your entry is not valid"
    puts turn
  end
end

#won?
  
def won?
  WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] &&
        @board[combo[1]] == @board[combo[2]] &&
        position_taken?(combo[1])
  end
end
    
#full?

def full?
  @board.all?{|played| played != " "}
end

#draw?

def draw?
  full? && !won?
end 

#over?

def over?
  won? || draw? || full?
end

#winner

def winner
  if winner_array = won?
      @board[winner_array[0]]
  end
end

#play
def play
  while over? == false
  turn
  end
  if won?
      puts "Congratulations #{winner}!"
  else draw?
      puts "Cat's Game!"
    end
end

end