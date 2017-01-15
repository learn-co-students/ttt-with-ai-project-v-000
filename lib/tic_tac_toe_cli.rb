class TicTacToeCLI

  def initialize
  end

  def start
    puts "Welcome to Tic Tac Toe!"
    puts "Select the number of players: (0-2)?"
    input = gets.strip

    if input == "0"
      game = Game.new(Computer.new("X", true), Computer.new("O", true))
      game.play
    elsif input == "1"
      puts "Who should go first? Choose h for Human or c for Computer?"
      first = gets.strip
      if first == "h"
        game = Game.new(Human.new("X", true), Computer.new("O", true))
        game.play
      elsif first == "c"
        game = Game.new(Computer.new("X", true), Human.new("O", true))
        game.play
      end
    elsif input == "2"
      puts "Let's play!"
      game.play
    else
      puts "Would you like to play again? (y/n)"
      play_again == gets.strip
      if play_again == "y"
        tic_tac
      elsif play_again == "n"
        puts "Thanks for playing!"
      end
    end
  end

end
