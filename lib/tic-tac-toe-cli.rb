class TicTacToeCLI

  def initialize
  end

  def start
    puts "Welcome to Tic Tac Toe"
    puts "Enter 0 to watch the ultimate computer on computer face-off!"
    puts "Enter 1 to play against the computer."
    puts "Enter 2 to play against a friend."
    puts "Please enter a number:"
     input = gets.strip
     if input.to_i == 0
      Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O")).play
      puts "Would you like to play again? ('y' or 'n')"
      play_again
    elsif input.to_i == 2
    Game.new.play
    puts "Would you like to play again? ('y' or 'n')"
    play_again
    else
      puts "Would you like to go first? ('y' or 'n')"
      first_player = gets.strip.downcase
      if first_player == 'y'
        Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O")).play
    else
        Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O")).play
      end
      puts "Would you like to play again? ('y' or 'n')"
      play_again
    end
  end

  def play_again
    input = gets.strip.downcase
    while input != 'y' || input != 'n'
      puts "Please enter 'y' or 'n'."
    case input
    when 'y'
      start
    when 'n'
      puts "Ok. Thanks for playing!"
      abort
      end
    end
  end
end
