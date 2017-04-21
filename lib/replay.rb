class Replay

  def self.new_game?
    input = ""
    while input != "y" && input != "n"
      puts "Do you wish to play again? 'y' or 'n'?"
      input = gets.strip
      case input
        when "y"
          Game.new.start
        when "n"
          exit
        when "exit"
          exit
        else
          puts "Invalid selection - Please try again!"
      end
    end
  end
  
end
