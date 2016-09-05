class CLI
  def start_game
    puts "Welcome to Tic Tac Toe!"
    game = Game.new
    until game.won?
      game.play
    end

    input = ""
    until input.downcase == "n"
      puts "Would you like to play again?"
      input = gets.strip
      if input.downcase == "y"
        game = Game.new
        until game.won?
          game.play
        end
      end
    end
  end
end
