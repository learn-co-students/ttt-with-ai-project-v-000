class TicTacToeCLI

  # Runs the game of Tic Tac Toe that is in the /lib folder
  def call  
    puts "Welcome to Tic Tac Toe"
    puts "Do you want a 0, 1 or 2 player game?"
    game = gets.chomp.to_s
    until game == "0" || game == "1" || game == "2"
      puts "Please enter numbers only - please enter 0, 1 or 2 for the number of players in the game:"
      game = gets.chomp.to_s
    end
    case game
      when "0"
        puts "The tic tac toe demons will now play!"
        Game.new(Players::Computer.new("X"), player_2 = Players::Computer.new("O")).play
      when "1"
        puts "You are playing against a demon!"
        Game.new(Players::Human.new("X"), player_2 = Players::Computer.new("O")).play
      when "2"
        puts "Your game is starting"
        Game.new.play
    end
  end
end  