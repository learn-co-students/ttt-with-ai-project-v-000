class Game
  attr_accessor :board, :player_1, :player_2
  attr_reader :token
  
  WIN_COMBINATIONS = [
  [0,1,2],  #Top Row Combo
  [3,4,5],  #Middle Row Combo
  [6,7,8],  #Bottom Row Combo
  [0,3,6],  #Left Row Combo
  [1,4,7],  #Middle Row Combo
  [2,5,8],  #Right Row Combo
  [0,4,8],  #Left Diag Combo
  [2,4,6]   #Right Diag Combo
  ]

def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
end

def current_player
  @board.turn_count % 2 == 0 ? @player_1 : @player_2
end

def won?
  WIN_COMBINATIONS.detect do |winner|
    @board.cells[winner[0]] == @board.cells[winner[1]] &&
    @board.cells[winner[1]] == @board.cells[winner[2]] &&
    (@board.cells[winner[0]] == "X" || @board.cells[winner[0]] == "O")
  end 
end

def draw?
 @board.full? && !won?
end

def over?
  draw? || won?
end 

def winner
  if combo = won?
  @winner = @board.cells[combo.first]
end 
end

def turn 
  input = current_player.move(board)
  index = input.to_i - 1 
  if index.between?(0, 8) == false || @board.valid_move?(input) == false
    puts "invalid"
    turn 
  else 
    @board.update(input, current_player)
  end 
end

def play
  until over?
  turn
end 
if draw?
end 
puts "Cat's Game!"
if won?
end 
puts "Congratulations #{winner}!"
end


def start
  puts "Welcome to the wild world of Tic Tac Toe!"
  puts "Please enter number of players: (0-2)"
  answer = gets.chomp
  case answer
  when "0"
    puts "Watch two AI's duke it out!"
    @player_1 = Computer.new("X")
    @player_1.board = self.board
    @player_2 = Computer.new("O")
    @player_2.board = self.board
    self.play
  when "1"
    puts "Choose your alliance! X - O ?"
    side = gets.chomp
    if side == "X"
      @player_2 = Computer.new("O")
      @player_2.board = self.board
      elsif side == "O"
      @player_1 = Computer.new("O")
      @player_1.board = self.board
    else 
      puts "That alliance doesn't exist..."
      puts "Restarting..."
      self.start
    end 
    puts "Get ready!"
    puts "Game starting..."
    @board.display
    self.play
  when "2"
    puts "Choose who goes first! *Hint* It's X... ;)"
    puts "Initializing!"
    self.play
  else 
  puts "Not supported!"
  puts "Let's give this another shot..."
  self.start
end
end


def post_game
  puts "Run this back?? Y/N"
  answer = gets.chomp
  
  case answer
  when "Y" || "y"
    puts "Restarting..."
    self.start
  when "N" || "n"
    puts "Aw, well we should do this again sometime..."
    exit
  else 
    puts "Woops..."
    self.post_game
  end 
end 


  



end 
