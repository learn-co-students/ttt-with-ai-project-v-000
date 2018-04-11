require "pry"

class Game
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[2,5,8], [1,4,7],[0,4,8],[6,4,2]]

  attr_accessor :board, :player_1, :player_2
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def current_player
    if self.board.turn_count.even? == true 
      self.player_1
    else 
      self.player_2
    end
  end
  
  def won?
    WIN_COMBINATIONS.any? do |array|
      cell_one = self.board.cells[array[0]]
      cell_two = self.board.cells[array[1]]
      cell_three = self.board.cells[array[2]]
      if cell_one == "X" && cell_two == "X" && cell_three == "X"
       return array
      elsif cell_one == "O" && cell_two == "O" && cell_three == "O"
       return array
     else 
       false
     end
    end
  end

def draw?
  if self.won? != false
    false 
  elsif self.board.full? == false 
    return false 
  else 
    true 
  end
end
  
  def over?
    if self.draw? == true || self.won? != false 
      true 
    else 
      false
  end
end

def winner
  WIN_COMBINATIONS.detect do |array|
    winner = self.board.cells[array[0]]
    if won? == array && winner == "X" 
      return "X"
    elsif  won? == array && winner == "O" 
      return "O"
    elsif won? == false 
      return nil
    end
end
end

def turn 
  puts "Please enter 1-9:"
  input = self.current_player.move(board)
  if self.board.valid_move?(input) 
     self.board.update(input, current_player)
     self.board.display
  elsif !self.board.valid_move?(input)
  puts "That position is already taken." 
    self.turn
  end
end

def play 
  self.board.display
  until self.over?
  self.turn 
  end
  if self.winner
  puts "Congratulations #{winner}!"
  elsif self.draw?
  puts "Cat's Game!"
end
end

def self.intro 
  puts "Welcome to TicTacToe!"
  puts "If you would like to play a 0 player game, please enter 0."
  puts "If you would like to play a 1 player game, please enter 1."
  puts "If you would like to play a 2 player game, please enter 2."
end

def end_of_game
  puts "Would you like to keep playing TicTacToe?"
  puts "If you would like to replay the game that you just completed, please enter 'replay'."
  puts "If you would like to change the players and start a new game, please enter 'new game'."
  puts "If you would like to exit the program, please enter 'exit'."
  game_end = gets.chomp 
  case game_end
    when "replay"
      self.class.zero_player
    when "new game"
      self.class.intro 
      self.class.start
    when "exit"
      return
  end
end

def self.zero_player
  puts "The computer will be Player 1 and Player 2. Player 1 will use the X token. Player 2 will use the O token."
  zero_player = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
    zero_player.play
    zero_player.end_of_game
end

def self.one_player_1
  one_player_1 = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
  one_player_1.play
  one_player_1.end_of_game
end

def self.one_player_2
  one_player_2 = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  one_player_2.play
  one_player_2.end_of_game
end

def self.two_player
   puts "Player 1 will use the X token. Player 2 will use the O token."
  two_player = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  two_player.play
  two_player.end_of_game
end


def self.start 
  input = gets.chomp
  if input == "0"
    self.class.zero_player
  elsif input == "1" 
    puts "Player 1 will use the X token and Player 2 will use the O token."
    puts "If you would like to be Player 1, please enter 1."
    puts "If you would like to be Player 2, please enter 2."
    player_input = gets.chomp
    if player_input == "1"
      self.class.one_player_1
    elsif player_input == "2"
      self.class.one_player_2
    end
  elsif input == "2"
    self.class.two_player
  end
end
  


end