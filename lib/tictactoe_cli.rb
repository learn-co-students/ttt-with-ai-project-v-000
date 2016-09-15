class TicTacToeCli
  
  def start
    welcome_msg
    game_loop
    exit_msg
  end

  def welcome_msg
    puts "Welcome to TicTacToe!"
  end

  def exit_msg
    puts "Thanks for playing!"
  end

  def game_start_msg
    puts "GAME START!"
  end

  def game_initialization(input)
    case input
      when "1"
        Game.new(Players::Computer.new("X"),Players::Computer.new("O"))
      when "2"
        Game.new(Players::Human.new("X"),Players::Computer.new("O"))
      when "3"
        Game.new(Players::Computer.new("X"),Players::Human.new("O"))
      else
        Game.new(Players::Human.new("X"),Players::Human.new("O"))
      end
  end

  def continue?
    print "Continue? (Y/n): "
    input = gets.strip

    until input == "" || input.downcase == "y" || input.downcase == "n"
      print "Sorry, try again.  Continue? (Y/n): "
      input = gets.strip
    end

    if input == "n"
      false
    else
      true
    end
  end

  def choose_game_type
    print "Choose a game type:\n1) 0-player game (watch the computer go head-to-head!)\n2) 1-player game (you start first!)\n3) 1-player game (the computer starts first!)\n4) 2-player game (play with a carbon-based friend!)\nChoose your selection: "
    input = gets.strip

    until input.to_i >= 1 && input.to_i <= 4
      print "Sorry, try again.  Please Enter 1-4: "
      input = gets.strip
    end

    input
  end

  def game_loop

    tic_tac_toe = nil
    still_playing = true

    while still_playing
      tic_tac_toe = game_initialization(choose_game_type)
      game_start_msg
      tic_tac_toe.play
      still_playing = continue?
    end
  end
end