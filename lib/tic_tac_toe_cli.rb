require 'pry'
class TicTacToeCLI
  
  def initialize
  end

  def call
    puts "Welcome to Tic Tac Toe!"
    @game = create_game

    @game.board.display


      until @game.over?
        @game.play
      end
      puts "Enter 'Y' to retry "
      gets.chomp.capitalize == "Y" ? call : (puts "Goodbye!")

     
  end

  def create_game
    puts "Choose your game mode"
    puts "1)Single Player, 2) Multiplayer 3)Computer vs Computer"
    choice = gets.strip.to_i
    case choice
      when 1
        @game = Game.new(Player::Human.new("X"),Player::Computer.new("O"))
      when 2
        @game = Game.new()
      when 3
        @game = Game.new(Player::Computer.new("X"),Player::Computer.new("O"))
      else
        puts "Invalid Choice"
        create_game
      end
  end
end