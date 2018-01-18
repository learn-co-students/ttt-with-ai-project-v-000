def two_player
  puts "Please enter the name of player one who will be X"
  p1 = gets.chomp
  player_1 = Players::Human.new("X", p1)
  puts "Please enter the name of player two who will be O"
  p2 = gets.chomp
  player_2 = Players::Human.new("O", p2)
  puts "The game will now begin"
  new_game = Game.new(player_1, player_2)
  new_game.board.display
  print "Player one "
  new_game.play
end

def single_player
  puts "Please enter your name"
  name = gets.chomp
  puts "Please enter the token you would like to be, 'X' or 'O'"
  token = gets.chomp
  token_check(token, name)
end

def compvscomp
  comp_1 = Players::Computer.new("X", "Computer 1")
  comp_2 = Players::Computer.new("O", "Computer 2")
  new_game = Game.new(comp_1, comp_2)
  new_game.play
end

def start
  puts "Welcome to Omar's tic tac toe."
  puts "Please enter the number of players that will be playing."
  puts "0, 1, or 2"
  input = gets.chomp
  case input.downcase
  when "0"
    compvscomp
  when "1"
    single_player
  when "wargames"
    wargames
  else
    two_player
  end
end

def wargames
  wins = 0
  1000.times do
    wins += compvscomp
    break if wins > 0
  end
  puts wins
end


def token_check(token, name)
  if token == 'x'
    player = Players::Human.new("X", name)
    comp = Players::Computer.new("O", "Computer")
    new_game = Game.new(player, comp)
    new_game.board.display
    new_game.play
  else
    player = Players::Human.new("O", name)
    comp = Players::Computer.new("X", "Computer")
    new_game = Game.new(comp, player)
    new_game.board.display
    new_game.play
  end
end
