class TttCli

  def start
    puts "Choose from the following games:"
    puts "0: Computer v Computer."
    puts "1: Player v Computer."
    puts "2: Player v Player."
    input = gets.strip

    if input == "0"
      puts "Computer v Computer:"
      cvc_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
      cvc_game.play
    elsif input == "1"
      puts "Player v Computer:"
      puts "Choose X or O."
      input_choice = gets.strip
      if input_choice == "X"
        pvc_game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
        pvc_game.play
      elsif input_choice == "O"
        pvc_game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
        pvc_game.play
      end
    elsif input == "2"
      puts "Player v Player:"
      puts "Player 1 is X, Player 2 is O."
      pvp_game = Game.new
      pvp_game.play
    else
      puts "Does not compute, try again partner."
    end
  end

  def initialize
    running = "y"
    until (running = gets.chomp) == "n"
      start
      puts "Would you like to play again? (y/n)"
    end
  end

end
