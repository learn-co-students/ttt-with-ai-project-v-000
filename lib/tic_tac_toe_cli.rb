class TicTacToeCLI

  def call
    puts "Welcome to fun with Tic Tac Toe!"
    human_players = 5

    until human_players.to_i == 0 || human_players.to_i == 1 || human_players.to_i == 2
      puts "How many human players will be in this game?(0, 1, 2)"
      human_players = gets.strip
    end

    # create array of names for computer players
    names_array = ["Benny", "John", "Jane", "Joe", "Sally", "Samantha", "Brooke"]
    auto_name_1 = names_array[rand(0..6)]
    auto_name_2 = names_array[rand(0..6)]

    while auto_name_2 == auto_name_1
      auto_name_2 = names_array[rand(0..6)]
    end

    if human_players.to_i == 2
      # ask for name of each player
      puts "Please enter the name of Player 1."
      name_1 = gets.strip
      if name_1 == nil || name_1 == ""
        name_1 == auto_name_1
      end
      set_player_1 = Players::Human.new("X")

      puts "Please enter the name of Player 2."
      name_2 = gets.strip
      if name_2 == nil || name_2 == ""
        name_2 == auto_name_2
      end
      set_player_2 = Players::Human.new("O")


    elsif human_players.to_i == 1
      # ask for the name of the human player and if human or computer goes first
      puts "Please enter the name of Player 1."
      name_1 = gets.strip
      if name_1 == nil || name_1 == ""
        name_1 == auto_name_1
      end
      set_player_1 = Players::Human.new("X")

      # assign name to computer player
      name_2 = auto_name_2
      set_player_2 = Players::Computer.new("O")
    else
      # assign names to computer players
      name_1 = auto_name_1
      set_player_1 = Players::Computer.new('X')
      name_2 = auto_name_2
      set_player_2 = Players::Computer.new('O')
    end

    game = Game.new(set_player_1, set_player_2)
    game.play

  end

end
