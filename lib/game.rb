

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
  [6,4,2]
]


def initialize(player_1=Human.new("X"), player_2=Human.new("O"), board=Board.new)
  @board = board
  @player_1 = player_1
  @player_2 = player_2
end

def current_player
  board.turn_count.even? ? player_1 : player_2
end

def over?
  draw? || won?
end

def won?
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]] &&
      board.cells[combo[0]] != " "
    end
  end

def draw?
  board.full? && !won?
end

def winner
  board.cells[won?[0]] if won?
end

def turn
  board.display
  input = current_player.move(board)
   if board.valid_move?(input)
    board.update(input, current_player)
    
   else
     puts "Invalid entry!"
     turn
   end

end

def play_again
  puts "Would you like to play again? (Y/N)"
  input = gets.strip.downcase

  if input == "y"
    self.class.start

  elsif input == "n"
    puts "Thanks for playing. Get some rest, practise and come back when you're ready to play with the big boys."
  end
end


def play
  turn until over?
  
  board.display
  puts won? ? "Congratulations #{winner}!" : "Cats Game!"
  
  play_again
end


def self.start
  puts "Enter the number of players who will be playing on this fine day:"

  input = gets.strip

  case input

  when "0"
   new_game = Game.new(Computer.new("X"), Computer.new("O"))

  when "2"
    new_game = Game.new


  when"1" 

    puts "Who should go first and be X? A:You B:Computer"
    input_2 = gets.strip.downcase
    if input_2 == "a"
      new_game = Game.new(Human.new("X"), Computer.new("O"))

    elsif input_2 == "b"
      new_game = Game.new(Computer.new("X"), Human.new("O"))
    end
  
  end

  new_game.play

end


end