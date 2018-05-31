class CLI

  def self.game_assign
    puts "Welcome to Tic-tac-toe!"
    puts "Would you like to play with 0, 1, or 2 players?"
      input = gets.strip
    if input == "0"
      puts "I will be X and I will be O!"
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
      game.play
    elsif input == "1"
      CLI.choice_token?
    elsif input == "2"
      puts "The first player will be X."
      game =Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new)
      game.play
    end
  end

  def self.choice_token?
    puts "Would you like to be X ? y/n?"
      token = gets.strip.downcase
    if token == "y"
      game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
      puts "You go first!"
      game.play
    elsif token == "n"
      game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
      puts "I'll go first!"
      game.play
    end
  end

  def self.play_again?
    puts "Would you like to play again? y/n?"
    input = gets.strip.downcase
    if input == "y"
      CLI.game_assign
    else
      exit
    end
    until input != "y" do
      CLI.play_again?
    end
  end


end
