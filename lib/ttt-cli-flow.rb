class GameLogic
  attr_accessor :input, :nobody_wins

  def intro
    puts "____________  ____________    _________    ____________  ____________    _________"
    puts "|____   ____| |____   ____|  /  _______|   |____   ____| |    ___    |  /  _______|"
    puts "     |  |          |  |     /  /                |  |     |   |___|   | /  /"
    puts "     |  |          |  |    |  |                 |  |     |    ___    ||  |"
    puts "     |  |      ____|  |___  \\  \\_______         |  |     |   |   |   | \\  \\_______"
    puts "     |__|     |___________|   \\_________|       |__|     |___|   |___|  \\_________|"
    puts "____________    _______   ____________  __________  ___       ___      ___      ___"
    puts "|____   ____|  /  ___  \\  |____   ____| |   ___   | |  |      |  |      \\  \\   /   /"
    puts "     |  |     /  /   \\  \\      |  |     |  |___|  | |  |      |  |       \\  \\/   /"
    puts "     |  |    |  |     |  |     |  |     |   ___   | |  |      |  |        \\    /"
    puts "     |  |     \\  \\___/  /      |  |     |  |   |  | |  |____  |  |____    /  /"
    puts "     |__|       \\______/       |__|     |__|   |__| |_______| |_______| /  /"
    puts "______________________________________________________________________/  /"
    puts "|______________________________________________________________________/"
    puts "What's goin on?! You're about to play a fast-paced, action-packed, mesmerizing \ngame of TIC TAC TOTALLY. It's kind of like Tic-Tac-Toe, except TOTALLY!\nPrepare to have your mind blown by things you've already seen in a game you've \nalready played, but this time brought to you by me!"
    puts "\nNOW, y'all tryina play a ONE player or TWO player game? Or maybe even 0 player??\n
    For 1 player, type '1'\n
    For 2 player, type '2'\n
    For 0 player, type 'Ghost town'\n
    For Senseless Destruction mode, type 'Trump'\n
    ---------------"
    return gets.strip
  end

  def one_player
    puts "\nSeriously? You're playing Tic Tac Toe alone? Wow. \nAlright, loser. Do you want to be 'X,' and go first, or 'O', and go not first? \nType 'X' or 'O'"
    answer = gets.strip.upcase

    if answer == "X"
      Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
    elsif answer == "O"
      Game.new(Players::Computer.new("X"), Players::Human.new("O")).play
    end
  end

  def two_player
    puts "\nHIGH FIVE, BRO!! You're not a total lamewad like the bozos over in 1 player mode! X goes first, decide amongst yourselves who that's going to be! Here comes a game board in 3...2...1..."
    sleep(7.0)
    Game.new.play
  end

  def ghost
    puts "*dusty tumbleweed*...*Clint Eastwood Music*...*Go ahead. Make my dinner...*"
    #sleep(3.0)
    Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
  end

  def bad_input
    "That's not a valid option. \n"
    intro
  end

  def call
    case intro
    when "1"
      one_player
    when "2"
      two_player
    when "Ghost town"
      ghost
    when "Trump"
      100.times do ghost
      end
    end
  end

end
