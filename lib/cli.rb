class CLI

  def call
    puts ""
    puts "Tic-Tac-Toe"
    horizontal_rule
    game_loop("Welcome to Tic-Tac-Toe!")
    puts "Thank you for playing!"
  end

  def game_loop(message)
    loop do
      puts message
      puts "Please chose the number of players:"
      puts "0. Players - Computer vs Computer"
      puts "1. Player - Computer vs Human"
      puts "2. Players - Human vs Human"
      puts "Type 'Exit' to exit."
      print ">"

      input = gets.chomp
      case input
      when "0"
        computer_vs_computer
      when "1"
        human_vs_computer
      when "2"
        human_vs_human
      when "exit" || "Exit"
        break
      else
        message = "#{input} is not a valid selection.  Please try: 0, 1, 2, or exit"
      end
    end
  end

  def horizontal_rule
    puts "-------------------------"
  end

  def computer_vs_computer
    horizontal_rule
    puts "The computer is now playing itself..."
    game = Game.new(Players::Computer.new('X'), Players::Computer.new('O'))
    game.play
  end

  def human_vs_computer
    horizontal_rule
    message = "Please choose Player #1 or #2:"
    begin
      puts message
      print ">"
      input = gets.chomp
      case input
      when '1'
        token = select_token("Player #1")
        game = Game.new(Players::Human.new(token), Players::Computer.new(opponent(token)))
      when '2'
        token = select_token("Player #2")
        game = Game.new(Players::Computer.new(opponent(token)), Players::Human.new(token))
      else
        puts "#{input} is not valid.  Please try 1 or 2:"
      end
    end until game
    puts "Your game is starting..."
    game.play
  end

  def human_vs_human
    horizontal_rule
    token = select_token("Player #1")
    game = Game.new(Players::Human.new(token), Players::Human.new(opponent(token)))
    puts "Your game is starting..."
    game.play
  end

  private
  def select_token(message)
    begin
      puts "#{message}, please choose your token, 'X' or 'O':"
      print ">"
      input = gets.chomp
      case input.downcase
      when 'x'
        token = "X"
      when 'o'
        token = "O"
      else
        puts "Your selection was not valid,..."
      end
    end until token
    return token
  end

  def opponent(token)
    if token == "X"
      "O"
    else
      "X"
    end
  end
end

