class CLI_Interface

  def self.start
    puts "Welcome to CLI Tic-Tac-Toe!"
    Game.start
    self.play_again?
  end

  def self.play_again?(input = "")
    until input == "n"
      puts "\n"
      puts "Play again? Y or N"
      input = gets.chomp.downcase
      if input == "y"
        Game.start
      else
        Game.display_scores
      end
    end
  end

end
