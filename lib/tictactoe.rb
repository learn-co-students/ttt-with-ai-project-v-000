require "pry"
class TicTacToeCLI
  attr_accessor :player, :players, :stats, :computer
    
    def initialize
      call
    end
    
    def call 
      puts "Welcome to Tic Tac Toe"
      puts "Pick player mode: 0,1 or 2 players?"
      how_many = gets.to_i 
      #binding.pry
      puts "Who should go first and be X?"
      first = gets.to_i
      
      if how_many == 2
        player_1_player_2
      end
      
      if how_many == 1
        computer_player_1
      end
      
      if how_many == 0 
        computer_computer
      end
    end
  
    def computer_computer
      game = Game.new(player_1= Players::Computer.new("X"), player_2 = Players::Computer.new("O"))
      game.board.display
      game.play
    end
  
    def computer_player_1
      game = Game.new(player_1= Players::Computer.new("X"), player_2 = Players::Human.new("O"))
      game.board.display
      game.play
    end
  
    def player_1_player_2
      game = Game.new(player_1= Players::Human.new("X"), player_2 = Players::Human.new("O"))
      game.board.display
      game.play
    end
  
    def play_again
      puts "Do you want to play again: y/n"
      answer = gets.strip
      if answer == "y"
        call
      elsif answer == "n"
        puts "Goodbye"
      end
    end
  end