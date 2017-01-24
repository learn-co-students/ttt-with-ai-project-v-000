# cli helper

def help
  puts "1: 0 Player mode (Com vs Com).\n2: 1 Player mode (Human vs Com).\n3: 2 Players mode (Human vs Human).\nhelp: to display this menu.\nexit: to quit.\n"
end


def zero_player
  puts "---- Com X vs Com O ----\n\n"

  player_1 = Computer.new("X")
  player_2 = Computer.new("O")

  Game.new(player_1, player_2).play
end

# Game between a Human and Computer
def one_player
  print "You won't beat me, but you can try :P\nWould you like to go first? (y/n): "
  input = gets.strip

  player_1, player_2 = nil

  if ["y", "yes"].include?(input.downcase)
    puts "---- Human X vs Com O ----\n\n"
    player_1 = Human.new("X")
    player_2 = Computer.new("O")
  elsif ["n", "no"].include?(input.downcase)
    puts "---- Com X vs Human O ----\n\n"
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
  puts "---- Human X vs Human O ----\n\n"

  player_1 = Human.new("X")
  player_2 = Human.new("O")

  Game.new(player_1, player_2).play
end
