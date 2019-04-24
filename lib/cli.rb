class Cli
  attr_accessor :play

  def initialize(play='yes')
    @play = play
  end

  def greet_user
    system "clear"
    puts "\u001b[31mWELCOME TO TIC TAC TOE WITH AI!"
    sleep(1)
  end

  def player_number
    puts ""
    puts "\u001b[37;1mPlease select the number of players: \u001b[33;1m 0, \u001b[31m 1, \u001b[37;1m or \u001b[34;1m 2 \u001b[37;1m"
    puts ""
    gets.strip
  end

  def first_player
    puts ""
    puts "Would you like to be \u001b[31mX\u001b[37m?  \u001b[32myes \u001b[37m/ \u001b[31mno \u001b[37m"
    puts ""
    gets.strip.downcase
  end

  def play_x_starts
    puts ""
    puts "\u001b[37;1mPlayer \u001b[31m X \u001b[37;1m goes first!"
    puts ""
  end

  def invalid_input
    puts ""
    puts "\u001b[33mInvalid input \u001b[37m"
    puts ""
    sleep(1)
  end

  def turn
    token_x = first_player
    if token_x == 'yes'
       Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
    elsif token_x == 'no'
       Game.new(Players::Computer.new("X"), Players::Human.new("O")).play
    else
       invalid_input
       turn
    end
  end

  def another_round
    puts ""
    # When the game is over, the CLI should prompt the user if they would like to play again
    puts "Would you like to play again? yes / no "
    user_says = gets.strip.downcase

    if user_says == 'no'
      #If the user doesn't want to play again, exit the program.
      self.play= "no"
      say_goodbye
    elsif user_says == 'yes'
       play = "yes"
    else
      invalid_input
      another_round
    end
  end

  def say_goodbye
    sleep(1)
    puts ""
    puts "Until next time."
    puts "End of line"
  end
end
