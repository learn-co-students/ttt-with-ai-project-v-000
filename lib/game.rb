#require 'pry'
#require 'board.rb'

class Game

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  attr_accessor :board, :player_1, :player_2
 

  def initialize(player_1 = Human.new("X"),player_2 = Human.new("O"),board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    counter = self.board.turn_count
    if counter % 2 == 0
      player_1
    else
      player_2
    end
  end


  def previous_player
    counter = self.board.turn_count
  
    if counter % 2 == 0
      player_2
    else
      player_1
    end
  end

  def over?
    self.draw? ||  self.won? 
  end

      
  def draw?
   self.board.full? && self.won? == nil
    #binding.pry
  end    


  def won?
      WIN_COMBINATIONS.detect do |line|
        line.all?{|i| self.board.cells[i] == "X" } || line.all?{|i| self.board.cells[i] == "O"}
      end
    end
<<<<<<< HEAD
=======
end
>>>>>>> 9e873e92960184f01ed4f5d383c952c550c6a5e8

  def winner
    if won?
      line = won?
      self.board.cells[line[0]]
    end
  end
<<<<<<< HEAD

  def turn
    input = self.current_player.move(self.board)
    if self.board.valid_move?(input)
      board.update(input,self.current_player)
    else
      self.turn
    end
    self.board.display
    puts "#{self.previous_player.token} has moved to cell #{input}."
    puts "_" * 45
    puts "\n"
=======
end

def turn
  input = self.current_player.move(self.board)
  if self.board.valid_move?(input)
    board.update(input,self.current_player)
  elsif input == "exit" 
    exit 0 
  else
    self.turn
>>>>>>> 9e873e92960184f01ed4f5d383c952c550c6a5e8
  end


  def play
    while !self.over? 
     self.turn
    end
    if won? 
      puts "Congratulations #{self.winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def self.start
    puts "Welcome to Tic Tac Toe!"
    puts "How many players would you like?: 0, 1, 2?"

    game_type = gets.strip

    if game_type == "0"
      game = Game.new(player_1=Computer.new("X"),player_2=Computer.new("O"))

    elsif game_type == "1"
      puts "_" * 45
      puts "\n"
      puts "Player 1 will be X, and Player 2 will be O."
      puts "Who is player 1: human, or computer?"
      first_player = gets.strip.downcase
        if first_player == "human"
          game = Game.new(player_1=Human.new("X"),player_2=Computer.new("O"))
        elsif first_player == "computer"
          game = Game.new(player_1=Computer.new("X"),player_2=Human.new("O"))
        elsif first_player =="exit"
          exit 0
        else
          puts "You didn't enter 'human' or 'computer,' so the computer will go first!" 
          game = Game.new(player_1=Computer.new("X"),player_2=Human.new("O"))
        end  
    elsif game_type == "2"
      game = Game.new
    elsif game_type == "exit"
      exit 0
    end

<<<<<<< HEAD
end  
















=======
    puts " 1 | 2 | 3 "
    puts "-" * 11
    puts " 4 | 5 | 6 "
    puts "-" * 11
    puts " 7 | 8 | 9 "
      #game.board.display
    puts "_" * 45
    puts "\n"
    until game.over?
      game.play
    end

    puts "Would you like to play again?"
    input = gets.strip
>>>>>>> 9e873e92960184f01ed4f5d383c952c550c6a5e8

    if input == "yes" || input == "y"
     Game.start
     else
      exit 0
    end  
  end

end  