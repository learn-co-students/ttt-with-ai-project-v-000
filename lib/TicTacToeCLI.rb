class TicTacToeCLI

  def call 
    puts "Welcome to Tic Tac Toe"
    puts "**********************"
    puts "Please choose how many players: 0, 1 or 2"
    
    input = gets.strip

    if input == "0"
      game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"))
      game.play
    elsif input == "1"
      game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"))
        game.play
    elsif input == "2"
      game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"))
        game.play 
    elsif input != "exit"
      puts "invalid input try again"
    elsif input == "exit"
      puts "Goodbye"
    end
  end

end