class Controller
  def start
    puts "Welcome to Tic-Tac-Toe!"
    puts "Plese select game mode (1~4):"
    puts "1. 0 Player Mode"
    puts "2. 1 Player Mode"
    puts "3. 2 Player Mode"
    puts "4. Exit"

    answer = gets.strip

    case answer
    when "1"
      player_1 = Players::Computer.new("X")
      player_2 = Players::Computer.new("O")
      game = Game.new(player_1, player_2)
      game.play
      self.restart?
    when "2"
      self.play_first?
      self.restart?
    when "3"
      game = Game.new
      game.play
      self.restart?
    else
      self.start unless answer == "4"
    end
  end

  def play_first?
    puts "Would you like to play first? (Y/N)"
    answer = gets.strip
    case answer
    when "Y"
      player_1 = Players::Human.new("X")
      player_2 = Players::Computer.new("O")
      game = Game.new(player_1, player_2)
      game.play
    when "N"
      player_1 = Players::Computer.new("X")
      player_2 = Players::Human.new("O")
      game = Game.new(player_1, player_2)
      game.play
    else
      self.play_first?
    end
  end

  def restart?
    puts "Would you like to play again? (Y/N)"
    answer = gets.strip
    case answer
    when "Y"
      Controller.new.start
    when "N"
      exit
    else
      self.restart?
    end
  end
end
