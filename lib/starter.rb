def players
  puts "Please enter the number of players: 0 - 2:"
  puts "0 - Computer vs Computer"
  puts "1 - Human vs Computer"
  puts "2 - Human vs Human"
  number_of_players = gets.strip
  
  if (0..2) === number_of_players.to_i
    number_of_players
  else  
    puts "That's not an option."
    players
  end
end

def start(players)
  case players
  when "0"
    game = Game.new(Player::Computer.new("X"), Player::Computer.new("O"), Board.new)
    game_flow(game)
  when "1"
    game = Game.new(Player::Human.new("X"), Player::Computer.new("O"), Board.new)
    game_flow(game)
  when "2"
    game = Game.new(Player::Human.new("X"), Player::Human.new("O"), Board.new)
    game_flow(game)
  end
end

def play_again?
  puts "Do you want to play again? (yes/no)"
  answer = gets.strip.downcase
  if answer == "yes"
    start(players)
  else
    puts "Thanks for playing Tic Tac Toe :)"
    exit
  end
end

def game_flow(game)
  game.board.display
  game.play
  play_again?
end