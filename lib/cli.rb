class CLI

  def call
    puts "Welcome to Tic Tac Toe!"
    play_game

    play_again = ""
    until play_again.downcase == "n" || play_again.downcase == "no"
      puts "Would you like to play again? (y/n)"
      play_again = gets.strip
      if play_again.downcase == "y" || play_again.downcase == "yes"
          play_game
      else
        puts "Goodbye!"
      end
    end
  end

  def play_game
    puts "How many players will there be 0, 1 or 2?"
    players = gets.strip
    if players == "0"
      game = Game.new(Computer.new("X"), Computer.new("O"))
    elsif players == "1"
      puts "Will player one be 'X' or 'O'?"
      player1_token = gets.strip.upcase
      if player1_token == "X"
        game = Game.new(Human.new("X"),Computer.new("O"))
      else
        game = Game.new(Human.new("O"),Computer.new("X"))
      end
    elsif players == "2"
      puts "Will player one be 'X' or 'O'?"
      player1_token = gets.strip.upcase
      if player1_token == "X"
        game = Game.new(Human.new("X"),Human.new("O"))
      else
        game = Game.new(Human.new("O"),Human.new("X"))
      end
    end

    game.board.display
    until game.over?
      game.play
    end
  end

end
