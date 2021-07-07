class TicTacToeCLI
  attr_accessor :num_players, :player_token, :game, :choice, :again

  def initialize
    puts "Hello and welcome to the first and ONLY 'virtual Tic Tac Toe' game to EVER be created!"
    sleep(1)
    puts "(But not really...)"
    sleep(2)
    puts "-----------"
    puts "Powered by, and brought to you by:  The Voltron 5,000 Power Ranger Engine 2.0"
    puts "-----------"
    sleep(1)
  end

  def again?
    sleep(1)
    puts "Play virtual Tic Tac Toe again? Type 'yes' or 'no' please."
    @again = gets.chomp.downcase

    unless @again == "yes" || @again == "no"
      puts "I said please!"
      again?
    else
      puts "You chose: #{@again}."
      sleep(1)
    end

    if @again == "yes"
      call
    else @again == "no"
    puts "Goodbye!"
    exit
    end
  end

  def call
    puts "How many players wish to play this epic game? 0, 1, or maybe 2?"
    @num_players = gets.chomp.to_i

    unless @num_players == 0 || @num_players == 1 || @num_players == 2
      puts "Give me a break of that Kit Kat bar..."
      sleep(1)
      call
    else
      puts "You chose: #{@num_players}."
      sleep(1)
    end

    if @num_players == 0
      comp_battle
    elsif @num_players == 1
      prompt
    elsif @num_players == 2
      puts "Enjoy humans!"
      sleep(1)
      game = Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new)
      game.play
      again?
    end
  end

  def comp_battle
    puts "Would you like to play 'wargames' mode or 'normal' mode?"
    @choice = gets.chomp.downcase

    unless @choice == "wargames" || @choice == "normal"
      puts "invalid option"
      comp_battle
    else
      puts "You chose: #{@choice}."
      sleep(1)
    end

    if @choice == "normal"
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
      game.play
      again?
    else @choice == "wargames"
    game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
    puts "The computers are ANGRY at each other... They're going to play 100 times to see who's better!"
    sleep(2)
    puts "wargames mode: ACTIVATED"
    sleep(2)
    puts ""
    sleep(1)
    puts ""
    sleep(1)
    puts "         ▄▀▀▀▀▀▀▀▀"
    puts "     █░░░░▒▒▒▒▒▒▒▒▒▒▒▒▀▀▄"
    puts "   █░░░▒▒▒▒▒▒░░░░░░░░▒▒▒░█"
    puts "   █░░░░░░▄██▀▄▄░░░░░▄▄▄░░░█"
    puts " ▄▀▒▄▄▄▒░█▀▀  ▄▄█░░░█ ▄█░░░█"
    puts " █░▒█▒▄░▀▄▄▄▀░░░░░░░░█░░░▒▒▒▒▒█"
    puts " █░▒█░█▀▄▄░░░░░█▀░░░░▀▄░░█▀▀▄▒█"
    puts "  █░▀▄░█▄░█▀▄▄░▀░▀▀░▄▄▀░▄█  █"
    puts "   █░░░░██░ ▀█▄▄▄█▄▄█▄ █  █ █"
    puts "    █░░░░▀▀▄░ █ ░█ █ █ █ █ ░█"
    puts "     ▀▄░░░░░▀▀█▄▄█▄█▄█▄█▄▀░░█"
    puts "       ▀▄▄░▒▒▒▒░░░░░░░░░░▒░░░█"
    puts "         ▀▀▀▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▀"
    sleep(2)
    puts ""
    100.times.each_with_index { |item, index| puts "Game #{index + 1} has been played with this result:"; item = game.play }
    again?
    end
  end

  def prompt
    puts "Who should go first? 'X' or 'O'? (the Computer is 'O' by default)"
    @player_token = gets.chomp.upcase

    unless @player_token == "X" || @player_token == "O"
      puts "wrong character"
      prompt
    else
      puts "You chose: #{@player_token}."
    end

    if @player_token == "X"
      game = Game.new(Players::Human.new(@player_token), Players::Computer.new("O"), Board.new)
      game.play
      again?
    else
      game = Game.new(Players::Computer.new("X"), Players::Human.new(@player_token), Board.new)
      game.play
      again?
    end
  end
end
