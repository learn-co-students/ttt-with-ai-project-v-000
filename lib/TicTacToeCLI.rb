class TicTacToeClI

  def initialize
    #greating
    puts "Welcome!!"
    puts "At anytime press 'control + c' to exit"
      call
  end

  def call
    puts "How many Human Players will be playing today?"
    num_players = gets.chomp.strip
    until num_players == "0" || num_players == "1" || num_players == "2"
      puts "Your input doesn't compute!!"
      puts "Try again"
      puts "How many Human Players will be playing today?"
      num_players = gets.chomp.strip
    end
    if num_players == "0"
       computer_vs_computer
     elsif num_players == "1"
       one_player_mode
     elsif num_players == "2"
       two_player_mode
     end
  end

  def one_player_mode
    #one player mode
    puts "Who should start the game Human or Computer ? ('X' starts the game)"
    first_player = gets.downcase.chomp.strip
      if first_player == "human" || first_player == "h"
        game=Game.new(player_1=Players::Human.new("X"),player_2=Players::Computer.new("O"))
        game.board.display
        game.play

      elsif first_player == "computer" || first_player == "c"
        game=Game.new(player_1=Players::Computer.new("X"),player_2=Players::Human.new("O"))
        game.board.display
        game.play
      else
        puts "That Responce Does not Compute. Please Try Again!"
        one_player_mode
      end
  end


  def two_player_mode
    # 2 player mode
     puts " 'X' starts the game"
     game = Game.new
     game.board.display
     game.play
  end

  def computer_vs_computer
    # computer vs computer
     game=Game.new(player_1=Players::Computer.new("X"),player_2=Players::Computer.new("O"))
     game.board.display
     game.play
  end


end
