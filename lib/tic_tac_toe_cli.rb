class TicTacToeCLI

  def call
    play_again = " "

    while play_again != "exit"

    puts "Hello! Enter the number of players. 0, 1, or 2."
    num_players = gets.strip

    if num_players == "0"
      puts "You will watch the computer play!"
      player_1 = Computer.new("X")
      player_2 = Computer.new("O")

    elsif num_players == "1"
      puts "You will play against the computer! Who do you want to go first and be X? Enter Human or Computer."
      first_player = gets.strip
      if first_player.downcase == "human"
        player_1 = Human.new("X")
        player_2 = Computer.new("O")
      elsif first_player.downcase == "computer"
        player_1 = Computer.new("X")
        player_2 = Human.new("O")
      end

    elsif num_players == "2"
      puts "Play against another human!"
      player_1 = Human.new("X")
      player_2 = Human.new("O")
    end

    game = Game.new(player_1, player_2)
    game.play
    puts "Would you like to play again? If yes, hit enter. If no, type 'exit'."
    play_again = gets.strip

    end

  end

end