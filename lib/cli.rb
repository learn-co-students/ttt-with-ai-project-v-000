class Cli

  def start

    puts "Welcome to Tic Tac Toe! Select one of options below:"
    puts "Option 0: Computer will play itself"
    puts "Option 1: Play against Computer"
    puts "Option 2: Play against an Opponent"
    
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
