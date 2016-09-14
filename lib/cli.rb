class Cli
  attr_accessor :game

  def initialize
    puts "Hello, Welcome to Tic Tac Toe!"
    sleep(1)
    game = self.start
    game.play
    sleep(1)
    play_again?
  end

  def start
    puts "What kind of game would you like to play: 0, 1, or 2 players?"
    input = gets.strip
    if input == "0"
      self.game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
    elsif input == "1"
      puts "Who should go first and be 'X'? (Human/Computer)"
      input = gets.strip.upcase
      case input
      when "HUMAN"
          self.game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
          game
      when "COMPUTER"
          self.game = Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new)
          game
      else
          puts "I didn't understand that."
          puts "Who should go first and be 'X'? (Human/Computer)"
          input = gets.strip.upcase
      end
    elsif input == "2"
      self.game = Game.new
    elsif input == "wargames"
      puts "Executing wargames"
      sleep(0.5)
      Game.wargames
      puts "Game 100"
      sleep(0.1)
      self.game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
    else
      puts "I didn't understand that."
      start
    end
  end

  def play_again?
    self.game = nil
    puts "Would you like to play again? (Y/N)"
    input = gets.strip.upcase
    if input == "Y"
      self.game = start
      self.game.play
      play_again?
    elsif input == "N"
      puts "Thanks for playing!"
    else
      puts "I didn't understand that."
      play_again?
    end
  end
end
