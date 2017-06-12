class CLI

  def initialize
  end

  def call
    puts "Hello! Welcome to Tic-Tac-Toe!"
    puts "How many players? 0, 1, or 2?"

    players = gets.strip

      if players == "0"
        computer
      elsif players == "1"
        one_player
      elsif players == "2"
        two_player
      end
  end

  def computer
    Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
  end

  def one_player
    puts "Who goes first (X)? Human or Computer?"
      first_player = gets.downcase.chomp.strip
        if first_player == "human" || first_player == "h"
          game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"))
          game.board.display
          game.play
        elsif first_player == "computer" || first_player == "c"
          game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"))
          game.board.display
          game.play
        else
          puts "Sorry, I do not understand this command! Please try again."
          one_player
        end
  end

  def two_player
    puts "X starts the game:"
      game = Game.new
      game.board.display
      game.play
  end

end
