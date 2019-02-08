class Game

attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
          ]


def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
end



def current_player
  if board.cells.count(" ").odd?
      return player_1
  else
    player_2
  end
end

def won?
  array = board.cells
  WIN_COMBINATIONS.each do |combination|
    x=combination[0]
    y=combination[1]
    z=combination[2]
    if (array[x]=="X" && array[y]=="X" && array[z]=="X") || (array[x]=="O" && array[y]=="O" && array[z]=="O")
      return combination
    end
  end
  return false
end

def draw?
 board.full? && !won?
end

def over?
 won? || draw?
end

def winner
  if !won?
    return nil
  else
    array = won?
    board_array = board.cells
    board_array[array[0]]
  end
end

def turn
     
     input = current_player.move(board)
     if board.valid_move?(input)
         board.update(input, self.current_player)
     else
         turn
     end
   
end

def start 
  puts "Welcome to Tic Tac Toe! Would you like to play?"
  puts "Select which type of game you would like to play."
  puts "Enter 0 for the computer to play against itself."
  puts "Enter 1 if you would like to play directly against the computer."
  puts "Enter 2 to play against a friend!"
  input = gets.strip

  case input

  when "0"
    @player_1 = Players::Computer.new("X")
    @player_2 = Players::Computer.new("O")


  when "1"
    puts "Who should play first and be X?"
    puts "Enter 1 if you would like to play first."
    puts "Enter 2 if you would like the computer to play first."
    first = gets.strip
    if first == "1"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Computer.new("O")
    else
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Human.new("O")
    end

  when "2"
    @player_1 = Players::Human.new("X")
    @player_2 = Players::Human.new("O")
  end
  play
end

def play
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end
end