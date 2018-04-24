class TicTacToeCLI

  def start
    puts "WELCOME TO TIC TAC TOE!"
    puts "\n"
    game_options
  end

  def game_options
     puts "Game Options:"
     puts "   0 - Watch the computer play itself."
     puts "   1 - Play against the computer."
     puts "   2 - Play against a friend."
     puts "\n"
     puts "Please enter '0', '1', or '2' to start the game."
     input = gets.strip.to_i

     if input == 0
       game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
     elsif input == 1
       game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
     elsif input == 2
       game = Game.new(Players::Human.new("X"), Players::Human.new("O"))
     end

     game.play

     if game.over?
       play_again
     end
   end

  def play_again
  play_again = ""
  until play_again == "no" || play_again == "n"
    puts "Would you like to play again?"
    puts "   Type 'yes' or 'y' to continue."
    puts "   Type 'no' or 'n' to end the game."
      play_again = gets.strip
    if play_again == "yes" || play_again == "y"
      game_options
    elsif play_again == "no" || play_again == "n"
      puts "See you later!"
    end
  end
end

end
