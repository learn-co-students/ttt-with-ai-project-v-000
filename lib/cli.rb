class Cli
  def greeting
    playtime = " "

    while playtime != "exit"
      puts "So you want to play Tic-Tac-Toe, eh?"
      sleep(1)
      puts "Well, you've come to the right place!"
      sleep(1)
   
      puts "Please choose from the following options:"
      puts "Type '0' for zero player mode"
      puts "Type '1' for one player mode"
      puts "Type '2' for two player mode"

      player_option = gets.strip
        case player_option
          when "0"
            puts "Ah, so you just want me to do all the work, huh?"
            sleep(1)
            puts "Give me a second while I clone myself."
            sleep(1)
            puts "... cloning like a boss ..."
            sleep (2)
            puts "Alright, that was easy. Now sit back, relax, and enjoy the show."
            sleep(1)
            game = Game.new(player_1 = Player::Computer.new("X"), player_2 = Player::Computer.new("O"))
            game.play
            sleep(1)
          when "1"
            puts "Ah, so it's gonna be me and you then!"
            sleep(1)
            puts "Do you want to go first or should I? I'm a gentleman, so I'm good either way."
            puts "Type 'X' if you want to go first. If you'd like to go second, type 'O'."
            x_or_o = gets.strip.upcase
              game = Game.new(player_1 = Player::Human.new("X"), player_2 = Player::Computer.new("O")) if x_or_o == "X"
              game = Game.new(player_1 = Player::Computer.new("X"), player_2 = Player::Human.new("O")) if x_or_o == "O"
            puts "Alright, enough talking. Show me what you got. ;)"
            sleep(1)
            game.play
            sleep(1)
          when "2"
            puts "Oh, I see how it is."
            sleep(0.5)
            puts "You got a partner for yourself now. Everybody knows and I feel left out."
            sleep(1)
            puts "Don't mind me, I'll just be dancing poorly in the back."
            sleep(1)
            puts "*soft sob*"
            sleep(2)
            game = Game.new
            game.play
            sleep(1)
        end
      puts "So we've come to the end."
      sleep(1)
      puts "Type 'leggo' to play again, or 'exit' to leave the game."
      playtime = gets.strip.downcase
    end
  end
end