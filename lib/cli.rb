class Cli

  def self.welcome
    puts "Hello, Welcome to Tic Tac Toe!"
    sleep(1)
    self.start
  end

  def self.start
    puts "What kind of game would you like to play: 0, 1, or 2 players?"
    input = gets.strip
    if input == "0"
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
      self.play_game(game)
    elsif input == "1"
      puts "Who should go first and be 'X'? (Human/Computer)"
      input = gets.strip.upcase
      case input
      when "HUMAN"
          game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
          self.play_game(game)
      when "COMPUTER"
          game = Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new)
          self.play_game(game)
      else
          puts "I didn't understand that."
          puts "Who should go first and be 'X'? (Human/Computer)"
          input = gets.strip.upcase
      end
    elsif input == "2"
      game = Game.new
      self.play_game(game)
    elsif input == "wargames"
      puts "Executing wargames"
      sleep(0.5)
      Game.wargames
      puts "Game 100"
      sleep(0.1)
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
      self.play_game(game)
    else
      puts "I didn't understand that."
      self.start
    end
  end

  def self.play_game(game)
    game.play
    sleep(1)
    self.play_again?
  end

  def self.play_again?
    puts "Would you like to play again? (Y/N)"
    input = gets.strip.upcase
    if input == "Y"
      self.start
    elsif input == "N"
      puts "Thanks for playing!"
    else
      puts "I didn't understand that."
      self.play_again?
    end
  end
end
