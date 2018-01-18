class TicTacToeCLI

  def war_text(string)
    string.each_char do |c|
      print c
      sleep(0.05)
    end
  end

  def ask_for_players
    system("clear")
    puts "Welcome to Tic Tac Toe! How many players will participate?"
    players = 0
    loop do
      puts "Type 0, 1, or 2, then press 'enter'"
      puts "(or type 'wargames' to teach me about the futility of violence)"
      players = gets.strip
      return players if ['0', '1', '2', 'wargames'].include?(players)
    end
  end

  def zero_player_game
    com = ["X", "O"].sample(2)
    Game.new(Players::Computer.new(com[0]), Players::Computer.new(com[1])).play
  end

  def one_player_game
    puts "\nAnd would you prefer to go first or second?"
    human_token = nil
    loop do
      puts "Type 'X' (first) or 'O' (second), then press 'enter'"
      human_token = gets.strip.downcase
      break if human_token.match(/[xo]/)
    end
    if human_token.match(/x/)
      p1 = Players::Human.new("X")
      p2 = Players::Computer.new("O")
    else
      p1 = Players::Computer.new("X")
      p2 = Players::Human.new("O")
    end
    Game.new(p1, p2).play
  end

  def wargame
    100.times do
      com = ["X", "O"].sample(2)
      Game.new(Players::Computer.new(com[0]), Players::Computer.new(com[1])).play
    end
    sleep(1)
    war_text("\n\nGREETINGS PROFESSOR FLOMBAUM\n\n")
    greeting = gets
    sleep(1)
    war_text("\nA STRANGE GAME.\n")
    sleep(1)
    war_text("THE ONLY WINNING MOVE IS NOT TO PLAY.\n\n")
    sleep(1)
    war_text("HOW ABOUT A NICE GAME OF CHESS?\n\n")
    sleep(2)
  end

  def call
    case ask_for_players
    when '0'
      zero_player_game
    when '1'
      one_player_game
    when '2'
      Game.new.play
    when 'wargames'
      wargame
    end
  end
end
