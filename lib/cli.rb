class Cli

  def start
    player_amount = ""
    until player_amount == "0" || player_amount == "1" || player_amount == "2"
      puts "Welcome to Tic-Tac-Toe!"
      puts "Please select the number of players."
      puts "0 / 1 / 2 "
      player_amount = gets.strip
    end

    player1 = " "
    until player1 == "x" || player1 ==  "o"
      puts "Please select a token for the first player."
      puts "x / o"
      player1 = gets.strip.downcase
    end

    if player1 == "o"
       player2 = "X" ; player1 = "O"
    elsif player1 == "x"
      player2 = "O" ; player1 = "X"
    end

    case player_amount
    when "0"
      game = Game.new(Players::Computer.new(player1), Players::Computer.new(player2))
       game.play
    when "1"
      game = Game.new(Players::Human.new(player1), Players::Computer.new(player2))
       game.play
    when "2"
        game = Game.new(Players::Human.new(player1), Players::Human.new(player2))
        game.play
    end
    end_of_game
    end

    def end_of_game
      puts "Would you like to play another game?"
      puts "y / n"
      i = gets.chomp
      case i
        when "y"
          start
        when "n"
          exit
        else
        end_of_game
      end
    end
  end
