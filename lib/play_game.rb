class PlayGame

  def play
    puts "How many human players? (0-2)"
    players = gets.strip.to_i

    case players
    when 0
      puts "You have chosen for the computer to play itself"
      game = Game.new(Player::Computer.new("X"), Player::Computer.new("O"))
      game.play
    when 1
      puts "You have chosen to play against the computer"
      puts "Will you be player 1 or player 2? (1-2)"
      input = gets.strip
    when 2
      puts "You have chosen to play against another person"
      game = Game.new
      game.play
    else
      puts "Invalid entry... Goodbye!"
      play
    end
  end
end
