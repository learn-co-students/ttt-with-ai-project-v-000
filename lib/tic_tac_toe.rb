# cli helper

def help
  puts "1: 0 Player (Com vs Com).\n2: 1 Player (Human vs Com).\n3: 2 Players (Human vs Human).\nhelp: to display this menu.\nexit: to quit.\n\n"
end

def two_players
  player_1 = Human.new("X")
  player_2 = Human.new("O")

  Game.new(player_1, player_2).play
end
