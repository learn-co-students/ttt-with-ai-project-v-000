# cli helper

def help
  puts "1: 0 Player (Com vs Com).\n2: 1 Player (Human vs Com).\n3: 2 Players (Human vs Human).\nhelp: to display this menu.\nexit: to quit.\n\n"
end

# Game between a Human and Computer
def one_player
  puts "Would you like to go first? (y/n)"
  input = gets.strip

  player_1, player_2 = nil

  if ["y", "yes"].include?(input.downcase)
    player_1 = Human.new("X")
    player_2 = Computer.new("O")
  elsif ["n", "no"].include?(input.downcase)
    player_1 = Computer.new("X")
    player_2 = Human.new("O")
  else
    puts "Invalid input, quiting..."
    return
  end

  Game.new(player_1, player_2).play
end

# Game between two Humans
def two_players
  player_1 = Human.new("X")
  player_2 = Human.new("O")

  Game.new(player_1, player_2).play
end
