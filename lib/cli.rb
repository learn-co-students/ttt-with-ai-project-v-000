class Cli
  def start
    puts "                                          "
    puts ">>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<"
    puts "         Welcome to Tic Tac Toe!"

    input = ""
    while input != "exit"
      puts ">>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<"
      puts "                                          "
      puts "What type of game would you like to play?"
      puts "   To play in 0-player mode, type '0'."
      puts "   To play in 1-player mode, type '1'."
      puts "   To play in 2-player mode, type '2'."
      puts "   To quit, type 'exit'."
      input = gets.strip
      case input
      when "0"
        game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
        game.play

        if game.over?
          puts "                                          "
          puts "Would you like to play again? [Y/N]"
          input = gets.strip
          if input == "Y" || input == "y"
            input = ""
          else
            input = "exit"
          end
        end

      when "1"
        puts "                                          "
        puts "The first player is the 'X' player. Would you like to go first? [Y/N]"
        input = gets.strip
        if input == "Y" || input == "y"
          game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
          game.play
        elsif input == "N" || input == "n"
          game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
          game.play
        end

        if game.over?
          puts "                                          "
          puts "Would you like to play again? [Y/N]"
          input = gets.strip
          if input == "Y" || input == "y"
            input = ""
          else
            input = "exit"
          end
        end

      when "2"
        puts "                                          "
        puts "The first player is the 'X' player. Good luck!"
        puts "                                          "
        game = Game.new(Players::Human.new("X"), Players::Human.new("O"))
        game.play

        if game.over?
          puts "                                          "
          puts "Would you like to play again? [Y/N]"
          input = gets.strip
          if input == "Y" || input == "y"
            input = ""
          else
            input = "exit"
          end
        end

      when "Y" || "y" #|| "yes" || "Yes"
        input = ""
      when "n" || "N" #|| "no" || "No"
        input = 'exit'
      end

    end # end of while
  end # of method`
end # of class
