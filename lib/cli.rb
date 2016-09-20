class Cli

  def start

    puts "Welcome to tic tac toe! How many players wish to play?"
    num_players = gets.strip.to_i

    case num_players

    when 0
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
    when 1
      game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
    when 2
      game = Game.new
    end

    game.play
  end
end
