class TicTacToe

  def initialize
    puts "***********  Welcome to Tic Tac Toe! *********** \nWhat type of game would you like to play? \n
          Enter 0 for the computer to play itself. \n
          Enter 1 to play the computer. \n
          Enter 2 to play with a human friend. \n
          Enter 3 to play wargames."

    game_type = gets.strip
    game_type = game_type.to_i
    puts "************************************************"

    case game_type
      when 0
        computer_computer
      when 1
        computer_human
      when 2
        human_human
      when 3
        wargames
    end
  end

  def computer_computer
    puts "Great! Let's have the computer play Tic-Tac-Toe against itself.\n\n"
    player_1 = Player::Computer.new("X")
    player_2 = Player::Computer.new("O")
    computer_computer_game = Game.new(player_1, player_2)
    computer_computer_game.play
  end

  def computer_human
    puts "Great! You can play Tic-Tac-Toe against the computer.\n\n"
    puts "Input 1 to go first and use the \"X\" token or input 2 to have the computer go first and have the \"X\" token.\n\n"
    player = gets.strip.to_i
    if player == 1
      player_1 = Player::Human.new("X")
      player_2 = Player::Computer.new("O")
      human_computer_game = Game.new(player_1, player_2)
    elsif player == 2
      player_1 = Player::Computer.new("X")
      player_2 = Player::Human.new("O")
      human_computer_game = Game.new(player_1, player_2)
    end
    human_computer_game.play
  end

  def human_human
    puts "Great! You can play Tic-Tac-Toe against another human friend!\n\n"
    puts "Please select the player who goes first and gets the \"X\" token. \n\nThe player going first should input \"start\" now to select their first move.\nOr input \"help\" if you want more information about how to play Tic Tac Toe.\n\n"
    go = gets.strip.downcase
    puts "\n \n"
    player_1 = Player::Human.new("X")
    player_2 = Player::Human.new("O")
    human_human_game = Game.new(player_1, player_2)
    if go == "start"
      human_human_game.play
    else
      human_human_game.help
    end
  end

  def wargames
    puts "Great! Let's have the computer play itself 100 times!"
    puts "Input \"go\" to start."
    until WarGame.game_count == 100
      puts "Great! Let's have the computer play Tic-Tac-Toe against itself.\n\n"
      player_1 = Player::Computer.new("X")
      player_2 = Player::Computer.new("O")
      computer_computer_game = WarGame.new(player_1, player_2)
      computer_computer_game.play
    end
    puts "There were #{WarGame.count_wins} wins."
    puts "There were #{WarGame.count_draws} draws."
    WarGame.play_again?
  end

end
