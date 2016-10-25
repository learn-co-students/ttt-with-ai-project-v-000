class Methods

  attr_reader :players

  def self.modes
    puts "Welcome to Tic Tac Toe"
    puts "How many of you will be joining us today?"
    @players = gets.strip
  end

  def self.start
    case @players
    when "0"
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
      game.board.display
      game.play
      self.again?

    when "1"
      puts "Choose your token"
      token_1 = gets.strip.upcase
      token_1 == "X" ? token_2 = "O" : token_2 = "X"
      game = Game.new(Players::Human.new(token_1), Players::Computer.new(token_2), Board.new)
      game.board.display
      game.play
      self.again?

    when "2"
      puts "Player 1 choose your token"
      token_1 = gets.strip.upcase
      token_1 == "X" ? token_2 = "O" : token_2 = "X"
      puts "Player 2 your token is #{token_2}"
      game = Game.new(Players::Human.new(token_1), Players::Human.new(token_2), Board.new)
      game.board.display
      game.play
      self.again?
    when "thermo"
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
      game.board.display
      100.times {|i| game.play}
      puts "#{game.counter}"
      self.again?
    end
  end

  def self.again?
    puts "Wanna go again? (y/n)"
    answer = gets.strip.downcase
    if answer == "yes" || answer == "y"
      modes
      start
    else
      puts "Thanks for playing"
      exit
    end
  end

end
