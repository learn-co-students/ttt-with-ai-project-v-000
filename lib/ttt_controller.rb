class TTTController

  def initialize
    puts "\e[H\e[2J"
    puts "Welcome to Tic Tac Toe."
    menu
  end

  def menu
    puts "How you wanna do this?\n--For 1 player, enter 1\n--For 2 players, enter 2\n--For wikked awesome, enter wargames\n(to quit, enter q at any time.)"
    action = gets.strip.downcase

    case action
    when "1"
      puts "One player game"
      Game.new(player_1=Human.new("X"), player_2=Computer.new("O")).play
    when "2"
      puts "Two-player game"
      Game.new.play
    when "wargames"
      puts "\e[H\e[2J"
      puts "Matthew Broderick is married to a horse.\n\n\n\n"
    when "q"
      puts "So long, schmuck."

    end
  end

end